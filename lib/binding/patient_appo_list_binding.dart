import 'package:get/get.dart';

import '../controller/controller.dart';

class PatientAppoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PatientAppoController>(PatientAppoController(), permanent: false);
  }
}
