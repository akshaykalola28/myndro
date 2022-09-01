import 'package:get/get.dart';

import '../controller/controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController(), permanent: false);
  }
}
