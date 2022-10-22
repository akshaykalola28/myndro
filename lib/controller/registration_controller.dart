import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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
  dynamic fromEdit;
  final formKey = GlobalKey<FormState>();
  final degreeKey = GlobalKey<FormState>();
  final bankKey = GlobalKey<FormState>();
  final gstKey = GlobalKey<FormState>();
  final kycKey = GlobalKey<FormState>();
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
  final TextEditingController professionController = TextEditingController();
  final TextEditingController practiceCertiNoController =
      TextEditingController();
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
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
  var bankCountryList = <CountryData>[].obs;
  var bankStateList = <StateData>[].obs;
  var bankCityList = <CityData>[].obs;
  CountryData? countryDropdown;
  CountryData? bankCountry;
  StateData? stateDropdown;
  StateData? bankState;
  CityData? cityDropdown;
  CityData? bankCity;
  String? genderDropdownValue;
  String? accTypeDropdowwn;
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
  FilePickerResult? pickedgst;
  var gstCerti = 'upload Your copy of GST Registration Certificate '.obs;

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
          bankCountryList.add(CountryData.fromJson(i));
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
        bankStateList.clear();
        cityListData.clear();
        bankCityList.clear();
        for (dynamic i in data) {
          stateListData.add(StateData.fromJson(i));
          bankStateList.add(StateData.fromJson(i));
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
        bankCityList.clear();
        for (dynamic i in data) {
          cityListData.add(CityData.fromJson(i));
          bankCityList.add(CityData.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  //add expert details
  void addExpertProfile() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.expertSignupProfile));
      request.fields.addAll({
        'expert_password': passController.text.trim(),
        'conf_password': confirmPassController.text.trim(),
        'doctor_category_id': fromEdit['category_id'],
        'expert_first_name': firstNameController.text.trim(),
        'expert_last_name': lastNameController.text.trim(),
        'expert_email': emailController.text.trim(),
        'phone_no': contactController.text.trim(),
        'expert_gender': genderDropdownValue ?? '',
        'expert_date': formattedDob.value,
        'expert_address':
            '  ${addLine1Controller.text.trim()} + ${addLine2Controller.text.trim()} + ${addLine3Controller.text.trim()}',
        'expert_zip_code': zipCodeController.text.trim(),
        'expert_country_id': countryDropdown?.countryId.toString() ?? '',
        'expert_state_id': stateDropdown?.stateId ?? '',
        'expert_city_id': cityDropdown?.cityId ?? '',
        'doctor_subcategory_id': '3'
      });

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var profileDataResponse = jsonDecode(respStr);
      Common.storePrefData(
          Common.strExpertProfileData, json.encode(profileDataResponse));
      if (response.statusCode == 200) {
        print('jsonData $profileDataResponse');
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(profileDataResponse["msg"] as String);
      }
    }
  }

  //add expert degree details
  void addExpertdegreeDetails() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strExpertProfileData);
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.expertSignupDegreeCode));
      request.fields.addAll({
        'user_id':
            (res.isNotEmpty ? jsonDecode(res)['User_id'] : '').toString(),
        'profession': professionController.text.trim(),
        'degree_name': degreeNameController.text.trim(),
        'degree_year': degreeYearController.text.trim()
      });
      request.files.add(await http.MultipartFile.fromPath(
          'degree-certificate', pickeddegree?.files.single.path ?? ''));
      request.files.add(await http.MultipartFile.fromPath(
          'practice-certificate',
          pickedPracticeCerti?.files.single.path ?? ''));

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        print('degree details added');
        print('jsonData $jsonData');
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  //add expert bank details
  void addExpertbankDetails() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strExpertProfileData);
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.expertSignupBankCode));
      request.fields.addAll({
        'user_id':
            (res.isNotEmpty ? jsonDecode(res)['User_id'] : '').toString(),
        'bank_name': bankNameController.text.trim(),
        'account_type': accTypeDropdowwn ?? '',
        'account_holder_name': holderNameController.text.trim(),
        'account_number': accNumberController.text.trim(),
        'ifsc_code': ifscCodeController.text.trim(),
        'country': countryDropdown?.countryId.toString() ?? '',
        'state_id': stateDropdown?.stateId ?? '',
        'city_id': cityDropdown?.cityId ?? '',
        'zip_code': branchZipController.text.trim()
      });
      request.files.add(await http.MultipartFile.fromPath(
          'cancel_cheque', pickedCheque?.files.single.path ?? ''));

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        print('bank details added');
        print('jsonData $jsonData');
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  //add expert GST details
  void addExpertGstDetails() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strExpertProfileData);
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.expertSignupGstCode));
      request.fields.addAll({
        'user_id': (res.isNotEmpty ? jsonDecode(res)['User_id'] : '').toString()
      });
      request.files.add(await http.MultipartFile.fromPath(
          'gst_registration', pickedgst?.files.single.path ?? ''));

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        print('gst details added');
        print('jsonData $jsonData');
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  //add expert KYC details
  void addExpertKycDetails() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strExpertProfileData);
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.expertSignupKyc));
      request.fields.addAll({
        'user_id':
            (res.isNotEmpty ? jsonDecode(res)['User_id'] : '').toString(),
      });
      request.files.add(await http.MultipartFile.fromPath(
          'aadhar_card', pickedAadharCard?.files.single.path ?? ''));
      request.files.add(await http.MultipartFile.fromPath(
          'pan_card', pickedPanCard?.files.single.path ?? ''));
      request.files.add(await http.MultipartFile.fromPath(
          'id_card', pickedOptionalCard?.files.single.path ?? ''));
      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        print('kyc details added');
        print('jsonData $jsonData');
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
