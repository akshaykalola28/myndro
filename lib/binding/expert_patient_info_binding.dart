import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertPatientInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertPatientInfoController>(ExpertPatientInfoController(),
        permanent: false);
  }
}
