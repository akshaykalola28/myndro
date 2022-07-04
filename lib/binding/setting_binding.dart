import 'package:get/get.dart';
import 'package:myndro/controller/controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController(), permanent: false);
  }
}
