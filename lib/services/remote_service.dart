import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myndro/services/services.dart';

class RemoteServices {
  final http.Client client = http.Client();

  // print response of api result
  static void printResponse(
      Map<String, String> header, dynamic body, http.Response response) {
    debugPrint('Header: $header');
    debugPrint('Body : $body');
    debugPrint('URL: ${response.request!.url}');
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
  }

  // print response of api result
  static void printMultipartResponse(Map<String, String> header, dynamic body,
      http.StreamedResponse response) {
    debugPrint('Header: $header');
    debugPrint('Body : $body');
    debugPrint('URL: ${response.stream}');
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.stream.bytesToString()}');
  }

  //get country list
  static Future<http.Response> getCountryList() async {
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $accessToken'
    };

    http.Response response = await http
        .get(Uri.parse(Apis.baseUrl + Apis.countryList), headers: header);
    printResponse(header, null, response);
    return response;
  }

  //send OTP
  static Future<http.Response> sendOtp(
    String phoneNo,
    String countryCode,
  ) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({
      'phone_no': phoneNo,
      'country_code': countryCode,
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.userOtp),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

//verify OTP
  static Future<http.Response> verifyOtp(
    int patientId,
    String otp,
  ) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({
      'patient_id': patientId,
      'otp': otp,
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.verifyOtp),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

//resend OTP
  static Future<http.Response> resendOtp(
    String phoneNo,
    String countryCode,
    int patientId,
  ) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({
      'patient_id': patientId,
      'country_code': countryCode,
      'phone_no': phoneNo,
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.resendOtp),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //patient Login
  static Future<http.Response> patientLogin(
    String email,
    String password,
  ) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({"email": email, "password": password});

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.patientLogin),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

//expert login
  static Future<http.Response> expertLogin(
    String email,
    String password,
  ) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({"email": email, "password": password});

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.expertSigninCode),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //add patient data
  static Future<http.Response> addPatientData(
      int patientId,
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
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({
      'patient_id': patientId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'date': date,
      'address_line_1': addLine1,
      'address_line_2': addLine2,
      'address_line_3': addLine3,
      'country': countryCode,
      'state_id': stateId,
      'city_id': cityId,
      'zip_code': zipCode,
      'password': password,
      'gender': gender
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.addPatient),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //get state list
  static Future<http.Response> getStates(
    String countryId,
  ) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};
    String postBody = json.encode({
      "countryid": countryId,
    });
    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.stateList),
      headers: header,
      body: postBody,
    );
    printResponse(header, '', response);

    return response;
  }

  //get city list
  static Future<http.Response> getCity(
    String stateId,
  ) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};
    http.Response response = await http.post(
      Uri.parse('${Apis.baseUrl}${Apis.cityList}?state_id=$stateId'),
      headers: header,
      // body: postBody,
    );
    printResponse(header, '', response);

    return response;
  }

  //get assessment question
  static Future<http.Response> getAssessmentQuestion(
    String token,
    String assessmentCategory,
  ) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({
      'jwt_token': token,
      'assement_category': assessmentCategory,
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.assessmentQuestion),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //create locker data
  static Future<http.Response> createPatientLocker(
      int patientId, String docTitle, String caseNo, String doc) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({
      "patient_id": patientId,
      "document_title": docTitle,
      "case_no": caseNo,
      "document": doc
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.postMndroLocker),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //get locker data list
  static Future<http.Response> getLockerDataList(int patientId) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({
      "patient_id": patientId,
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.listPatientDocuments),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //create appointment
  static Future<http.Response> createAppointment(
      int patientId,
      String email,
      String audioVideo,
      String appoDate,
      String appoTime,
      String docCat,
      String docSubCat,
      String doctorId) async {
    Map<String, String> header = {'Content-Type': 'application/json'};

    String postBody = json.encode({
      "patient_id": patientId,
      "patient_email": email,
      "audio_video": audioVideo,
      "doctor_category_id": docCat,
      "doctor_subcategory_id": docSubCat,
      "doctor_id": doctorId,
      "date": appoDate,
      "appt_time": appoTime
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.createAppointment),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //get expert category list
  static Future<http.Response> getExpertCategoryList() async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.expertSignupCategory),
      headers: header,
    );
    printResponse(header, '', response);

    return response;
  }

  //get expert Sub category list
  static Future<http.Response> getExpertSubCategoryList(
      String categoryId) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};
    String postBody = json.encode({
      "category_id": categoryId,
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.expertSignupSubCategory),
      headers: header,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //get search keywords list
  static Future<http.Response> getSearchKeywordsList() async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.searchKeyword),
      headers: header,
    );
    printResponse(header, '', response);

    return response;
  }

  //get all Doctors list
  static Future<http.Response> getAllDrList() async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.allDrList),
      headers: header,
    );
    printResponse(header, '', response);

    return response;
  }

  //get wallet data
  static Future<http.Response> getWalletData(String patientId) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};
    String postBody = json.encode({
      "patient_id": patientId,
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.walletTransactions),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //get wallet data
  static Future<http.Response> addMoneyToWallet(String patientId, String amount,
      String paymentId, String paymentJson) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};
    String postBody = json.encode({
      "patient_id": patientId,
      "amount": amount,
      "paymentID": paymentId,
      "PaymentJson": paymentJson
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.addMoneyInWallet),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //get dr slot list
  static Future<http.Response> getDrSlots(int doctorId) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};
    String postBody = json.encode({"doctor_id": doctorId, "fromDate": null});

    http.Response response = await http.post(
        Uri.parse(Apis.baseUrl + Apis.drSlotsList),
        headers: header,
        body: postBody);
    printResponse(header, postBody, response);

    return response;
  }

  //create doctor slots
  static Future<http.Response> saveDrSlots(int doctorId, String fromDate,
      String toDate, String fromTime, String toTime) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};
    String postBody = json.encode({
      "doctor_id": doctorId,
      "fromDate": fromDate,
      "toDate": toDate,
      "FromTime": fromTime,
      "toTime": toTime
    });

    http.Response response = await http.post(
        Uri.parse(Apis.baseUrl + Apis.saveDrSlots),
        headers: header,
        body: postBody);
    printResponse(header, postBody, response);

    return response;
  }

  //get expert appointment list
  static Future<http.Response> getExpertAppointmentList(String doctorId) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    String postBody = json.encode({
      "doctor_id": doctorId,
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.expertAppointmentList),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //get patient appointment list
  static Future<http.Response> getPatientAppointmentList(
      String patientId) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    String postBody = json.encode({
      "patient_id": patientId,
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.patientAppointmentList),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

//get expert package list
  static Future<http.Response> getExperPackageList(String doctorId) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    String postBody = json.encode({"doctor_id": doctorId, "status": ""});

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.expertPackageList),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

//TODO remove params txtCaseNo,txtPatientName
  //expert create package
  static Future<http.Response> expertCreatePackage(
      String doctorId,
      String packTitle,
      String packDetails,
      String sessionNo,
      String sessionDur,
      String packPrice) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    String postBody = json.encode({
      "txtCaseNo": "582",
      "doctor_id": doctorId,
      "txtPatientName": "api test",
      "txtpackageTitle": packTitle,
      "txtPackageDetails": packDetails,
      "txtnoOfSession": sessionNo,
      "txtSessionDuration": sessionDur,
      "txtPackagePrice": packPrice
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.expertCreatePackage),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //get expert messages
  static Future<http.Response> getExpertMsg(
      String expertId, String patientId, String appointmentId) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    String postBody = json.encode({
      "patient_id": patientId,
      "expert_id": expertId,
      "appointment_id": appointmentId
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.fetchExpertMsg),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //get patient messages
  static Future<http.Response> getPatientMsg(
      String expertId, String patientId, String appointmentId) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    String postBody = json.encode({
      "patient_id": patientId,
      "expert_id": expertId,
      "appointment_id": appointmentId
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.fetchPatientMsg),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //Send Expert messages
  static Future<http.Response> sendExpertMsg(String expertId, String patientId,
      String appointmentId, String chatMsg) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    String postBody = json.encode({
      "patient_id": patientId,
      "expert_id": expertId,
      "appointment_id": appointmentId,
      "chat_message": chatMsg
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.sendChatFromExpert),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }

  //Send Patient messages
  static Future<http.Response> sendPatientMsg(String expertId, String patientId,
      String appointmentId, String chatMsg) async {
    Map<String, String> header = {'Content-Type': 'application/json'};
    String postBody = json.encode({
      "patient_id": patientId,
      "expert_id": expertId,
      "appointment_id": appointmentId,
      "chat_message": chatMsg
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.sendChatFromPatient),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }
}
