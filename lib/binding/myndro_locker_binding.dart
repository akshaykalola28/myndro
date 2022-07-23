import 'package:get/get.dart';

import '../controller/controller.dart';

class MyndroLockerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyndroLockerController>(MyndroLockerController(), permanent: false);
  }
}
