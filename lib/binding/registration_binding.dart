import 'package:get/get.dart';

import '../controller/controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>RegistrationController());
  }
}