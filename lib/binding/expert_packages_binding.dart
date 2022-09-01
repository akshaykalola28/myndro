import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertPackagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertPackagesController>(ExpertPackagesController(),
        permanent: false);
  }
}
