import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

class Common {
  static const String strIsLogin = 'is_login';
  static const String strLoginRes = 'login_response';
  static const String strOtpRes = 'otp_response';
  static const String strExpertProfileData = 'expert_profile_data';
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

  static String? validateCaseNo(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Case No';
    } else {
      return null;
    }
  }

  static String? validateDocTitle(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Title';
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

  static String? validateDegreeName(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Degree Name';
    } else {
      return null;
    }
  }

  static String? validateProfession(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Profession';
    } else {
      return null;
    }
  }

  static String? validateDegreeYear(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Degree Year';
    } else {
      return null;
    }
  }

  static String? validateBankName(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Bank Name';
    } else {
      return null;
    }
  }

  static String? validateAccHolderName(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Account Holder Name';
    } else {
      return null;
    }
  }

  static String? validateAccNumberName(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Account Number';
    } else {
      return null;
    }
  }

  static String? validateIfsc(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter IFSC Code';
    } else {
      return null;
    }
  }

  static String? validateAadhar(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Aadhar Number';
    } else {
      return null;
    }
  }

  static String? validatePan(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Pan Card No.';
    } else {
      return null;
    }
  }

  static String? validateDetails(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Details';
    } else {
      return null;
    }
  }

  static String? validateNoOfSession(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter No. of Session';
    } else {
      return null;
    }
  }

  static String? validateSessionDuration(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Session Duration';
    } else {
      return null;
    }
  }

  static String? validateNotes(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter  a Note';
    } else {
      return null;
    }
  }

  static String? validateMedName(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter  a Medicine Name';
    } else {
      return null;
    }
  }

  static String? validateInstruction(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter  Instruction';
    } else {
      return null;
    }
  }

  static String? validateSessionPrice(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Session Price';
    } else {
      return null;
    }
  }

  static String? validateDocNo(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Document No.';
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

  static formatWalletDate(String? date) {
    return DateFormat('dd MMM yyyy HH:mm').format(DateTime.parse(date ?? ''));
  }

  static formatLockerDate(String? date) {
    return DateFormat('dd MMM yyyy').format(DateTime.parse(date ?? ''));
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
  static void displayMessage(String response) {
    Fluttertoast.showToast(msg: response);
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

  static Widget attachDocWidget(String text, VoidCallback onClick) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onClick,
      child: Container(
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
      ),
    );
  }
}
