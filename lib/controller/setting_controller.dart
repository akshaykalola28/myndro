import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class SettingController extends BaseController {
  @override
  void errorHandler(e) {}
  RxBool isChangePass = false.obs;
  RxBool isPassLoading = false.obs;
  RxBool isLoginLoading = false.obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void onClose() {
    super.onClose();
    isChangePass.value = false;
    isPassLoading.value = false;
    isLoginLoading.value = false;
  }

  void changePassword() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isPassLoading.value = true;
    if (status) {
      var response = await RemoteServices.patientChangePassword(
          jsonDecode(res)['PatientData']['patient_id'],
          passwordController.text.trim(),
          confirmPassController.text.trim());
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200 && jsonData["code"] == '4') {
        print('object $jsonData');
        isPassLoading.value = false;
        isChangePass.value = !isChangePass.value;
        passwordController.clear();
        confirmPassController.clear();
        Common.displayMessage(jsonData["msg"] as String);
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  //patient check login and send otp
  void checkLoginPass() async {
    bool status = await Common.checkInternetConnection();

    isLoginLoading.value = true;
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.patientCheckLogin));
      request.fields.addAll({
        'email': emailController.text.trim(),
        'password': passController.text.trim()
      });

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200 && jsonData["code"] == '4') {
        isLoginLoading.value = false;
        print('jsonData $jsonData');

        Get.toNamed(VerificationCodeScreen.pageId, arguments: {
          'isFrom2StepVerification': true,
        });
        Common.displayMessage(jsonData["msg"] as String);
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
