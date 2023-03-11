import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import '../constant/constant.dart';
import '../model/model.dart';
import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';
import 'package:http/http.dart' as http;

class HomeController extends BaseController {
  final DashboardController dashboardController = Get.find();
  @override
  void errorHandler(e) {}
  RxBool isLoading = false.obs;
  List<Appointment> patientAppoList = <Appointment>[].obs;
  @override
  void onInit() async {
    super.onInit();
    getPatientsList();
  }

  RxString audioVideoString = ''.obs;

  void getPatientsList() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getPatientAppointmentList(
          jsonDecode(res)['PatientData']['patient_id']);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['appointment'] as List;
      if (response.statusCode == 200) {
        patientAppoList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          patientAppoList.add(Appointment.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  displayDialog(BuildContext context, String doctorVideoCharge,
      String doctorAudioCharge, String doctorId) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Call Type'),
          content: Builder(
            builder: (context) {
              var width = MediaQuery.of(context).size.width;

              return SizedBox(
                width: width,
                child: Form(
                  // key: formKey,
                  child: GroupButton(
                    controller: GroupButtonController(
                      selectedIndex: 0,
                    ),
                    options: GroupButtonOptions(
                      selectedShadow: const [],
                      unselectedShadow: const [],
                      unselectedColor: Colors.transparent,
                      selectedColor: ColorsConfig.colorBlue,
                      unselectedTextStyle: const TextStyle(
                        color: ColorsConfig.colorBlack,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    isRadio: true,
                    onSelected: (val, i, selected) {
                      if (i == 0) {
                        audioVideoString.value = 'video';
                      } else {
                        audioVideoString.value = 'audio';
                      }
                    },
                    buttons: [
                      'Video call \n \u{20B9}$doctorVideoCharge',
                      'Audio call \n \u{20B9}$doctorAudioCharge',
                    ],
                  ),
                ),
              );
            },
          ),
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
              },
            ),
            TextButton(
              child: Text(
                'Call',
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 18.0,
                  color: ColorsConfig.colorBlue,
                ),
              ),
              onPressed: () {
                instantConnectAppointment(doctorId, context);
              },
            ),
          ],
        );
      },
    );
  }

  void instantConnectAppointment(String doctorId, BuildContext context) async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.instantConnectAppointment));
      request.fields.addAll({
        'doctor_id': doctorId,
        'audio_video': audioVideoString.value.toLowerCase(),
        'patient_id':
            res.isNotEmpty ? jsonDecode(res)['PatientData']['patient_id'] : '',
        'patient_email': res.isNotEmpty
            ? jsonDecode(res)['PatientData']['patient_email']
            : '',
      });

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        print('jsonData $jsonData');
        Common.displayMessage(jsonData["msg"] as String);
        if (jsonData["msg"].toString().toLowerCase().contains('money') ||
            jsonData["msg"].toString().toLowerCase().contains('wallet')) {
          Get.back();
          Get.toNamed(WalletScreen.pageId);
        }
        if (jsonData["msg"].toString().toLowerCase().contains('connecting') &&
            jsonData["code"] == '4') {
          Get.back();
          Common.launchCallURL(context, jsonData["URL"]);
          dashboardController.getTransactionsList('today');
          // Get.toNamed(WebViewScreen.pageId, arguments: {
          //   'meetDetail': jsonData["URL"],
          // });
        }
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
