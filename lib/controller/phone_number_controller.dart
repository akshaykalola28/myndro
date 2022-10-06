import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'base_controller.dart';

class PhoneNumberController extends BaseController {
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void errorHandler(e) {}
  List<CountryData> countryListData = <CountryData>[].obs;

  @override
  void onInit() {
    getCountryList();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.clear();
    super.dispose();
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
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        for (dynamic i in data) {
          countryListData.add(CountryData.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  void getOtp(String phoneNo, String countryCode) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.sendOtp(phoneNo, countryCode);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        var data = jsonData["data"];
        // print(data);
        Common.storePrefData(Common.strOtpRes, json.encode(jsonData));
        print('responsesss ${data['patient_phone_no']}');
        Get.toNamed(VerificationCodeScreen.pageId, arguments: {
          'data': data,
          'isFrom2StepVerification': false,
          'phone': phoneController.text,
          'country': dropdownValue!.countryCode!
        });

        phoneController.clear();
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
      print('otp send');
    }
  }
}
