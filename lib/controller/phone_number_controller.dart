import 'dart:convert';

import 'package:get/get.dart';

import '../model/model.dart';
import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'base_controller.dart';

class PhoneNumberController extends BaseController {
  @override
  void errorHandler(e) {}
  List<CountryData> countryListData = <CountryData>[].obs;
  @override
  void onInit() {
    getCountryList();
    super.onInit();
  }

  CountryData? dropdownValue;
  // List listType = ['abc', 'def', 'ghi'];

  void setSelected(CountryData value) {
    dropdownValue = value;
    update();
  }

  void getCountryList() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getCountryList();
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var data = jsonData["data"] as List;
        // feedbackList.clear();
        for (dynamic i in data) {
          countryListData.add(CountryData.fromJson(i));
        }
        // reversedFeedbackList = feedbackList.reversed.toList();
      }
    }
  }

  void getOtp(String phoneNo, String countryCode) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.sendOtp(phoneNo, countryCode);
      if (response.statusCode == 200) {
        Get.toNamed(VerificationCodeScreen.pageId, arguments: false);
      } else {
        Common.displayErrorMessage(response.body);
      }
      print('otp send');
    }
  }
}
