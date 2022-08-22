import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/constant.dart';

class Common {
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
    var error;
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
}
