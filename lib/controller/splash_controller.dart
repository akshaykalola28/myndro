import 'dart:async';

import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';

import '../screens/screens.dart';
import '../util/common.dart';
import 'base_controller.dart';

class SplashController extends BaseController {
  @override
  void errorHandler(e) {}
  late bool _isFirstRun;

  @override
  void onInit() async {
    bool isFirstTime = await IsFirstRun.isFirstRun();
    _isFirstRun = isFirstTime;
    Timer(const Duration(seconds: 2), goToLogin);
    super.onInit();
  }

  void goToLogin() async {
    bool isLogin = await Common.retrieveBoolPrefData(Common.strIsLogin);

    if (isLogin) {
      if (!_isFirstRun) {
        return Get.offAllNamed(LoginScreen.pageId);
      } else {
        return Get.offAllNamed(OnBoardingScreen.pageId);
      }
    } else {
      if (!_isFirstRun) {
        return Get.offAllNamed(LoginScreen.pageId);
      } else {
        return Get.offAllNamed(OnBoardingScreen.pageId);
      }
    }
  }
  }
