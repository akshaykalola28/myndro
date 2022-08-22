import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import '../widgets/widgets.dart';
import 'base_controller.dart';

class RegistrationController extends BaseController {
  @override
  void errorHandler(e) {}
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addLine1Controller = TextEditingController();
  final TextEditingController addLine2Controller = TextEditingController();
  final TextEditingController addLine3Controller = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  List<CountryData> countryListData = <CountryData>[];
  CountryData? countryDropdown;
  String? genderDropdownValue;
  var fromVerification;
  @override
  void onInit() {
    fromVerification = Get.arguments;
    getCountryList();
    getStateList();
    getCityList();
    super.onInit();
  }

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
        Get.offAndToNamed(UserRegistration.pageId,);
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

  //add patient details
  void addPatient(
      BuildContext context,
      String firstName,
      String lastName,
      String email,
      String date,
      String addLine1,
      String addLine2,
      String addLine3,
      int countryCode,
      int stateId,
      int cityId,
      String zipCode,
      String password,
      String gender) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.addPatientData(
          fromVerification[0]['patient_id'],
          firstName,
          lastName,
          email,
          date,
          addLine1,
          addLine2,
          addLine3,
          countryCode,
          stateId,
          cityId,
          zipCode,
          password,
          gender);
      if (response.statusCode == 200 && response.body[1] != 'error') {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return AnimatedDialog(
                outputText: 'Congratulations',
                subText: 'Your Account has Created Successfully.',
                titleSubtext: '  ',
                onClose: () {
                  Get.offAllNamed(DashboardScreen.pageId);
                },
              );
              // Timer(const Duration(seconds: 3), goToDashboard);
            });
      } else {
        Common.displayErrorMessage(response.body);
      }

    }
  }

  void getCountryList() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getCountryList();
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var data = jsonData["data"] as List;
        for (dynamic i in data) {
          countryListData.add(CountryData.fromJson(i));
        }
        // getStateList();
      } else {
        Common.displayErrorMessage(response.body);
      }
    }
  }


  void getStateList() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getStates(103);
      if (response.statusCode == 200) {
        print('object state');
        // getCityList();
        // var jsonData = json.decode(response.body);
        // var data = jsonData["data"] as List;
        // for (dynamic i in data) {
        //   countryListData.add(CountryData.fromJson(i));
        // }
      } else {
        Common.displayErrorMessage(response.body);
      }
    }
  }
  //city list
  void getCityList() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getCity(21);
      if (response.statusCode == 200) {
        print('object city');
        // var jsonData = json.decode(response.body);
        // var data = jsonData["data"] as List;
        // for (dynamic i in data) {
        //   countryListData.add(CountryData.fromJson(i));
        // }
      } else {
        Common.displayErrorMessage(response.body);
      }
    }
  }
}
