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
      int patientId, String email, String audioVideo, String doc) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({
      "patient_id": patientId,
      "patient_email": "amit@gmail.com",
      "audio_video": "Audio",
      "doctor_category_id": "2",
      "doctor_subcategory_id": "3",
      "doctor_id": "18",
      "date": "25-09-2022",
      "appt_time": "10:00 PM"
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.postMndroLocker),
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

  //add expert profile data
  static Future<http.Response> addExpertProfileData(
      String firstName,
      String lastName,
      String expertEmail,
      String dob,
      String addLine1,
      String countryCode,
      String expertContact,
      int stateId,
      int cityId,
      int drCategoryId,
      int drSubCategoryId,
      String zipCode,
      String gender) async {
    Map<String, String> header = {'Content-Type': 'text/plain'};

    String postBody = json.encode({
      "user_id": 18,
      "doctor_category_id": drCategoryId,
      "expert_first_name": firstName,
      "expert_last_name": lastName,
      "profession": 25,
      "expert_email": expertEmail,
      "doctor_contact_no": expertContact,
      "expert_gender": gender,
      "expert_date": dob,
      "expert_address_line_1": addLine1,
      "expert_zip_code": zipCode,
      "expert_country_id": countryCode,
      "expert_state_id": stateId,
      "expert_city_id": cityId,
      "aadhar_card": 25,
      "pan_card": 25,
      "id_card": 25,
      "doctor_subcategory_id": drSubCategoryId
    });

    http.Response response = await http.post(
      Uri.parse(Apis.baseUrl + Apis.expertSignupFinalCode),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }
}
