import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertHomeController>(ExpertHomeController(), permanent: false);
  }
}