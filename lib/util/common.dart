

import 'package:flutter/cupertino.dart';

class Common{

  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Name';
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
    }
    if (value.length < 6) {
      return 'Password must be a 6 character';
    }
    return null;
  }
}