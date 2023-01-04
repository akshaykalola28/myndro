import 'package:get/get.dart';

import '../controller/controller.dart';

class CallScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CallScreenController>(CallScreenController(), permanent: false);
  }
}
