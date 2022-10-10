import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
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

  List<String> genderList = ['Male', 'Female'];
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
  final TextEditingController contactController = TextEditingController();
  final TextEditingController degreeNameController = TextEditingController();
  final TextEditingController degreeYearController = TextEditingController();
  final TextEditingController practiceCertiNoController =
      TextEditingController();
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController accNumberController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  final TextEditingController branchAddController = TextEditingController();
  final TextEditingController branchAdd1Controller = TextEditingController();
  final TextEditingController branchZipController = TextEditingController();
  final TextEditingController gstNoController = TextEditingController();

  final TextEditingController aadharNoController = TextEditingController();
  final TextEditingController panNoController = TextEditingController();
  final TextEditingController docNoController = TextEditingController();
  var countryListData = <CountryData>[].obs;
  var stateListData = <StateData>[].obs;
  var cityListData = <CityData>[].obs;
  CountryData? countryDropdown;
  StateData? stateDropdown;
  CityData? cityDropdown;
  String? genderDropdownValue;
  String? dropdownValue;
  var fromOtpScreen = Get.arguments;
  RxBool passwordVisible = true.obs;
  RxBool confirmPasswordVisible = true.obs;
  Rx<DateTime> dob = DateTime.now().subtract(const Duration(days: 1)).obs;
  RxString formattedDob = 'DOB'.obs;
  FilePickerResult? pickeddegree;
  var degreeCerti = 'Degree Certificate'.obs;
  FilePickerResult? pickedPracticeCerti;
  var practiceCerti = 'Practice Certificate'.obs;
  FilePickerResult? pickedCheque;
  var cancelCheque = 'Attach Your Cancel Cheque'.obs;
  FilePickerResult? pickedAadharCard;
  var aadharCard = 'Aadhar Card'.obs;
  FilePickerResult? pickedPanCard;
  var panCard = 'Pan Card'.obs;
  FilePickerResult? pickedOptionalCard;
  var optionalCard = 'Driving/ Voter Id / Passport'.obs;
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
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200 && jsonData['type'] != 'error') {
        print('object otp  verified');
        Get.toNamed(
          UserRegistration.pageId,
        );
        otpController.clear();
      } else {
        Common.displayMessage(jsonData["msg"] as String);
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
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200 && jsonData['type'] != 'error') {
        print('object resend  verified');
        // Get.toNamed(UserRegistration.pageId);
        // otpController.clear();
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
      print('otp send');
    }
  }

  Future<void> selectDob(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dob.value,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime.now().subtract(const Duration(days: 1)));
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
    var res = await Common.retrievePrefData(Common.strOtpRes);
    if (status) {
      var response = await RemoteServices.addPatientData(
          res.isNotEmpty ? jsonDecode(res)['data']['patient_id'] : '',
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
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200 && response.body[1] != 'error') {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return AnimatedDialog(
                outputText: 'Congratulations',
                subText: 'Your Account has Created Successfully.',
                titleSubtext: '',
                onClose: () {
                  Get.offAllNamed(LoginScreen.pageId);
                },
              );
              // Timer(const Duration(seconds: 3), goToDashboard);
            });
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
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

  void getStateList(String countryId) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getStates(countryId);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        stateListData.clear();
        cityListData.clear();
        for (dynamic i in data) {
          stateListData.add(StateData.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  //city list
  void getCityList(String stateId) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getCity(stateId);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        cityListData.clear();
        for (dynamic i in data) {
          cityListData.add(CityData.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  //add patient details
  void addExpertProfile() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.addExpertProfileData(
          firstNameController.text.trim(),
          lastNameController.text.trim(),
          emailController.text.trim(),
          formattedDob.value,
          '  ${addLine1Controller.text.trim()} + ${addLine1Controller.text.trim()}',
          countryDropdown?.countryId ?? '',
          contactController.text.trim(),
          int.parse(stateDropdown?.stateId ?? ''),
          int.parse(cityDropdown?.cityId ?? ''),
          25,
          25,
          zipCodeController.text.trim(),
          genderDropdownValue ?? '');
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200 && response.body[1] != 'error') {
        print('profile data addded');
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
