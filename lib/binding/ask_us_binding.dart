import 'package:get/get.dart';

import '../controller/controller.dart';

class AskUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AskUsController>(AskUsController(), permanent: false);
  }
}
