import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertCalenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertCalenderController>(ExpertCalenderController(),
        permanent: false);
  }
}
