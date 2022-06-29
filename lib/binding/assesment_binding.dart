import 'package:get/get.dart';

import '../controller/controller.dart';

class AssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AssessmentController>(AssessmentController(), permanent: false);
  }
}
