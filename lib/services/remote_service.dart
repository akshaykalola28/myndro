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
      Uri.parse('http://mynd.thepackaginghouse.in/api/${Apis.userOtp}'),
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
      Uri.parse('http://mynd.thepackaginghouse.in/api/${Apis.verifyOtp}'),
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
      Uri.parse('http://mynd.thepackaginghouse.in/api/${Apis.resendOtp}'),
      headers: header,
      body: postBody,
    );
    printResponse(header, postBody, response);

    return response;
  }
}
