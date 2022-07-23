import 'package:get/get.dart';

import '../controller/controller.dart';

class DoctorNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DoctorNotesController>(DoctorNotesController(), permanent: false);
  }
}
