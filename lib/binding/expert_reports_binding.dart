import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertReportsController>(ExpertReportsController(),
        permanent: false);
  }
}
