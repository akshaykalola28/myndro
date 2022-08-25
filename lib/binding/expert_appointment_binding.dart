import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertAppointmentController>(ExpertAppointmentController(),
        permanent: false);
  }
}
