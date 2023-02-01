import 'package:get/get.dart';

import '../controller/controller.dart';

class AssessmentCatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AssessmentCatController>(AssessmentCatController(),
        permanent: false);
  }
}
