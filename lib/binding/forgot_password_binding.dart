import 'package:get/get.dart';

import '../controller/controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController(), permanent: false);
  }
}