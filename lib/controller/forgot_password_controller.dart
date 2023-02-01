import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';
import '../util/common.dart';
import 'base_controller.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends BaseController {
  @override
  void errorHandler(e) {}
  RxInt radioSelected = 1.obs;
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController otpConfirmController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  RxBool ischeckOtp = false.obs;
  RxBool isOtpChecked = false.obs;
  final formKey = GlobalKey<FormState>();

  void sendForgotPassOTP() async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.sendForgotPassOtp));
      request.fields.addAll({
        'Mobile': phoneNoController.text.trim(),
        'UserTpe': radioSelected.value.toString()
      });

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        print('jsonData $jsonData');
        ischeckOtp.value = true;
        Common.displayMessage(jsonData["msg"] as String);
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  void checkForgotPassOTP() async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.checkForgotPassOtp));
      request.fields.addAll({
        'Mobile': phoneNoController.text.trim(),
        'UserType': radioSelected.value.toString(),
        'OTP': otpConfirmController.text.trim(),
      });

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        print('jsonData $jsonData');
        if (jsonData["code"] == '2') {
          ischeckOtp.value = false;
          otpConfirmController.clear();
        }
        if (jsonData["code"] == '4') {
          isOtpChecked.value = true;
        }

        Common.displayMessage(jsonData["msg"] as String);
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  void updateForgotPass() async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.updateForgotPass));
      request.fields.addAll({
        'Mobile': phoneNoController.text.trim(),
        'UserTpe': radioSelected.value.toString(),
        'txtPassword': confirmPassController.text.trim(),
      });

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200 && jsonData["code"] == '4') {
        print('jsonData $jsonData');

        Common.displayMessage(jsonData["msg"] as String);
        Get.back();
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
