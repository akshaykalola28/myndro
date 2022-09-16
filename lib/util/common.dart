import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

class Common {
  static const String strIsLogin = 'is_login';
  static const String strLoginRes = 'login_response';
  static const String strFirstTime = 'if_first_time';

  // store boolean preference data
  static void storeBoolPrefData(String key, bool res) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, res);
  }

  // retrieve boolean preference data
  static Future<bool> retrieveBoolPrefData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool b = prefs.getBool(key) ?? false;
    return b;
  }

  // store string preference data
  static void storePrefData(String key, String res) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, res);
  }

  // retrieve string preference data
  static Future<String> retrievePrefData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String str = prefs.getString(key) ?? '';
    return str;
  }

    // clear all preference data
  static void clearPrefData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }


  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Name';
    } else {
      return null;
    }
  }

  static String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Address';
    } else {
      return null;
    }
  }

  static String? validatePhoneNo(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Phone Number';
    } else {
      return null;
    }
  }

  static String? validateZipcode(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Zipcode';
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty || !regex.hasMatch(value)) {
      return 'Enter valid Email !!!';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Enter valid Password!!!';
    } else if (value.length < 6) {
      return 'Password must be a 6 character';
    }
    return null;
  }

  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      await Fluttertoast.showToast(msg: 'no internet connection');
      return false;
    }
    return true;
  }

  // Display error message from response json
  static void displayErrorMessage(String response) {
    var data;
    List error;
    data = json.decode(response);
    error = data['msg'] as List;
    Fluttertoast.showToast(msg: error[0]['message'] as String);
  }

  static Widget iconContainer(IconData icon, String text,
      {bool isPriceVisible = false, String? subText}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 25, color: ColorsConfig.colorWhite),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: ColorsConfig.colorBlue),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: ColorsConfig.colorBlack,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            isPriceVisible
                ? Text(
              subText!,
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: ColorsConfig.colorBlack,
              ),
            )
                : Container(),
          ],
        )
      ],
    );
  }

  static Widget attachDocWidget(String text) {
    return Container(
      height: 50,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorsConfig.colorWhite,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: ColorsConfig.colorBlue,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 16.0,
              color: ColorsConfig.colorBlue,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.attach_file,
            size: 25,
            color: ColorsConfig.colorBlue,
          ),
        ],
      ),
    );
  }
}
