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
    http.Response response = await http.post(
      Uri.parse('${Apis.baseUrl}${Apis.stateList}?country_id=$countryId'),
      headers: header,
      // body: postBody,
    );
    printResponse(header, '', response);

    return response;
  }

  //get city list
  static Future<http.Response> getCity(String stateId,) async {
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
  static Future<http.Response> getAssessmentQuestion(String token,
      String assessmentCategory,) async {
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
}
