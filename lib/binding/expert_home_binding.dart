import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertDashboardController>(ExpertDashboardController(), permanent: false);
  }
}