import 'dart:async';

import 'package:get/get.dart';

import '../screens/screens.dart';
import '../util/common.dart';
import 'base_controller.dart';

class SplashController extends BaseController {
  @override
  void errorHandler(e) {}
  @override
  void onInit() {
    Timer(const Duration(seconds: 2), goToLogin);
    super.onInit();
  }

  void goToLogin() async {
    bool isLogin = await Common.retrieveBoolPrefData(Common.strIsLogin);
    if (isLogin) {
      return Get.offAllNamed(DashboardScreen.pageId);
    } else {
      return Get.offAllNamed(OnBoardingScreen.pageId);
    }
  }
}
