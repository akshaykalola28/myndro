import 'package:get/get.dart';

import '../controller/controller.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NewPasswordController>(NewPasswordController(), permanent: false);
  }
}