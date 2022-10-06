import 'package:get/get.dart';

import '../controller/controller.dart';

class PsycologistDropdownBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PsycologistDropdownController>(PsycologistDropdownController(),
        permanent: false);
  }
}
