import 'dart:convert';

import 'package:get/get.dart';

import '../util/common.dart';
import 'controller.dart';

class DashboardController extends BaseController {
  @override
  void errorHandler(e) {}
  var tabIndex = 0;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
