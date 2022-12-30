import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertAppoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertAppoController>(ExpertAppoController(), permanent: false);
  }
}
