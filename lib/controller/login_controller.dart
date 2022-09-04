import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'base_controller.dart';

class LoginController extends BaseController{
  @override
  void errorHandler(e) {
  }
  void login(String email, String pass,) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.patientLogin(
          email, pass);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print("loginData $jsonData");

        if (jsonData["type"] == 'success') {
          print('00 login ');
          // Common.storeBoolPrefData(Common.strIsLogin, true);
          // Common.storePrefData(Common.strLoginRes, json.encode(jsonData));
          Get.offAllNamed(DashboardScreen.pageId);
        } else {
          Fluttertoast.showToast(msg: jsonData["msg"] as String);
        }
      }
    }
  }
}