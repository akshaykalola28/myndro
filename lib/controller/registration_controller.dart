import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'base_controller.dart';

class RegistrationController extends BaseController {
  @override
  void errorHandler(e) {}
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.clear();
    super.dispose();
  }

  void verifyOtp(int patientId, String otp) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.verifyOtp(patientId, otp);
      if (response.statusCode == 200 && response.body[1] != 'error') {
        print('object otp  verified');
        Get.toNamed(UserRegistration.pageId);
        otpController.clear();
      } else {
        Common.displayErrorMessage(response.body);
      }
      print('otp send');
    }
  }

  //resend otp
  void resendOtp(String phoneNo, String countryCode, int patientId) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response =
          await RemoteServices.resendOtp(phoneNo, countryCode, patientId);
      if (response.statusCode == 200 && response.body[1] != 'error') {
        print('object resend  verified');
        // Get.toNamed(UserRegistration.pageId);
        // otpController.clear();
      } else {
        Common.displayErrorMessage(response.body);
      }
      print('otp send');
    }
  }
}