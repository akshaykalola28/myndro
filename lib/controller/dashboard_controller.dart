import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myndro/widgets/profile_text_field.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import '../constant/constant.dart';
import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class DashboardController extends BaseController {
  @override
  void errorHandler(e) {}
  var tabIndex = 0;
  List<DoctorcategoryList>? selectedUserList = [];
  List<RandDoctors> drKeywordsList = <RandDoctors>[].obs;
  List<DoctorcategoryList> allDoctors = <DoctorcategoryList>[].obs;
  List<Wallet> transactionList = <Wallet>[].obs;

  RxString walletAmount = ''.obs;
  final TextEditingController walletAmt = TextEditingController();
  final razorpay = Razorpay();

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() async {
    getAllDoctorsList();

    getTransactionsList();
    super.onInit();
  }

  @override
  void dispose() {
    razorpay.clear();
    walletAmt.clear();
    super.dispose();
  }

  void getKeywordsList() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getSearchKeywordsList();
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['RandDoctors'] as List;
      if (response.statusCode == 200) {
        for (dynamic i in data) {
          drKeywordsList.add(RandDoctors.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  void getAllDoctorsList() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getAllDrList();
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['doctorcategory'] as List;
      if (response.statusCode == 200) {
        for (dynamic i in data) {
          allDoctors.add(DoctorcategoryList.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  void getTransactionsList() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.getWalletData(
        res.isNotEmpty ? jsonDecode(res)['PatientData']['patient_id'] : '',
      );
      var jsonData = json.decode(response.body);
      var data = jsonData["Slots"]['wallet'];
      if (response.statusCode == 200) {
        for (dynamic i in data) {
          transactionList.add(Wallet.fromJson(i));
        }

        walletAmount.value = jsonData["Slots"]['total_wallet_amount'];
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

//TODO --add paymentid and json
  void razorpayAddMoneyToWallet() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.addMoneyToWallet(
          res.isNotEmpty ? jsonDecode(res)['PatientData']['patient_id'] : '',
          walletAmt.text.toString(),
          '21',
          '21');
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        walletAmt.clear();
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Money to Wallet'),
          content: profileTextFieldWidget(
              walletAmt, (_) {}, TextInputType.number, 'Enter Amount'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 18.0,
                  color: ColorsConfig.colorBlue,
                ),
              ),
              onPressed: () {
                Get.back();
                walletAmt.clear();
              },
            ),
            TextButton(
              child: Text(
                'Add Money',
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 18.0,
                  color: ColorsConfig.colorBlue,
                ),
              ),
              onPressed: () {
                print(walletAmt.text);
                razorpay.on(
                    Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
                razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
                razorpay.on(
                    Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
                createOrder();
                // openCheckout();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    print(response);
    razorpayAddMoneyToWallet();
    getTransactionsList();
    Common.displayMessage('Amount Added to Wallet');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print(response);
    Common.displayMessage(response.message ?? '');
    walletAmt.clear();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print(response);
    Common.displayMessage(response.walletName ?? '');
    walletAmt.clear();
  }

// create order
  void createOrder() async {
    String username = 'rzp_test_l8L25pVFnNtgZt';
    String password = 'P0JtGhWOHaubOHSOdlPY1nkl';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": "${(num.parse(walletAmt.text) * 100)}",
      "currency": "INR",
      'receipt': 'order_ddd'
      // 'receipt': DateFormat('dd-MM-yyHH:mm:ss')
      //     .format(DateTime.now())
      //     .toString()
      //     .replaceAll(RegExp(r'[^\w\s]+'), '')
    };
    var res = await http.post(
      Uri.https("api.razorpay.com", "v1/orders"),
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );

    if (res.statusCode == 200) {
      openCheckout(jsonDecode(res.body)['id']);
    }
    print(res.body);
  }

  void openCheckout(String orderId) async {
    var profileData = await Common.retrievePrefData(Common.strLoginRes);
    var options = {
      'key': 'rzp_test_l8L25pVFnNtgZt',
      'amount': "${(num.parse(walletAmt.text) * 100)}",
      'name': 'Myndro',
      'timeout': 60 * 5,
      "currency": 'INR',
      'order_id': orderId,
      'created_at': 1572502745,
      'prefill': {
        'contact': profileData.isNotEmpty
            ? jsonDecode(profileData)['PatientData']['patient_mobile']
            : '',
        'email': profileData.isNotEmpty
            ? jsonDecode(profileData)['PatientData']['patient_email']
            : '',
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }
}
