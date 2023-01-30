import 'package:get/get.dart';

import '../controller/controller.dart';

class PrescriptionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PrescriptionDetailController>(PrescriptionDetailController(),
        permanent: false);
  }
}
