import 'dart:async';

import 'package:get/get.dart';

import '../screens/screens.dart';
import 'base_controller.dart';

class SplashController extends BaseController{
  @override
  void errorHandler(e) {
  }
  @override
  void onInit() {

    Timer(const Duration(seconds: 2), goToLogin);
    super.onInit();
  }
  void goToLogin() async {
      return Get.toNamed(LoginScreen.pageId);
  }
}