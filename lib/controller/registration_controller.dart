import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/model.dart';
import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import '../widgets/widgets.dart';
import 'base_controller.dart';

class RegistrationController extends BaseController {
  @override
  void errorHandler(e) {}

  List<String> genderList = ['Male','Female'];
  RxBool addVisibility = false.obs;
  final String password = "";
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
  var countryListData = <CountryData>[].obs;
  var stateListData = <StateData>[].obs;
  var cityListData = <CityData>[].obs;
  CountryData? countryDropdown;
  StateData? stateDropdown;
  CityData? cityDropdown;
  String? genderDropdownValue;
  var fromOtpScreen;
  Rx<DateTime> dob = DateTime.now().obs;
  RxString formattedDob = 'DOB'.obs;
  String countryId =' -1';
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    fromOtpScreen = Get.arguments;
    getCountryList();
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
        Get.offAllNamed(UserRegistration.pageId,);
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



  Future<void> selectDob(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dob.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != dob.value) {
      dob.value = picked;
      formattedDob.value = DateFormat('dd-MM-yyyy').format(dob.value);
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
      String countryCode,
      int stateId,
      int cityId,
      String zipCode,
      String password,
      String gender) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.addPatientData(
          fromOtpScreen[0]['patient_id'],
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
      } else {
        Common.displayErrorMessage(response.body);
      }
    }
  }


  void getStateList(String countryId) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getStates(countryId);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var data = jsonData["data"] as List;
        for (dynamic i in data) {
          stateListData.add(StateData.fromJson(i));
        }
      } else {
        Common.displayErrorMessage(response.body);
      }
    }
  }
  //city list
  void getCityList(String stateId) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getCity(stateId);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var data = jsonData["data"] as List;
        for (dynamic i in data) {
          cityListData.add(CityData.fromJson(i));
        }
      } else {
        Common.displayErrorMessage(response.body);
      }
    }
  }
}
