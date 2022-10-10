import 'dart:convert';

import 'package:get/get.dart';

import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'base_controller.dart';

class LoginController extends BaseController {
  @override
  void errorHandler(e) {}
  bool rememberPassSelected = false;
  bool isLoading = false;
  int radioSelected = 1;
  void login(
    String email,
    String pass,
  ) async {
    isLoading = true;
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = radioSelected == 1
          ? await RemoteServices.patientLogin(email, pass)
          : await RemoteServices.expertLogin(email, pass);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print("loginData $jsonData");

        if (jsonData["type"] == 'success') {
          print('00 login ');
          if (rememberPassSelected) {
            Common.storeBoolPrefData(Common.strIsLogin, true);
          } else {
            Common.storeBoolPrefData(Common.strIsLogin, false);
          }
          Common.storePrefData(Common.strLoginRes, json.encode(jsonData));
          radioSelected == 1
              ? Get.offAllNamed(DashboardScreen.pageId)
              : Get.offAllNamed(ExpertHome.pageId);
        } else {
          Common.displayMessage(jsonData["msg"] as String);
        }
      }
      isLoading = false;
    }
  }
}
