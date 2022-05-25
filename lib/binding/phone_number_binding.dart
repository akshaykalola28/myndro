import 'package:get/get.dart';

import '../controller/controller.dart';

class PhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PhoneNumberController>(PhoneNumberController(), permanent: false);
  }
}