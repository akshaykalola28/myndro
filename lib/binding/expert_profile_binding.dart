import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertProfileController>(ExpertProfileController(),
        permanent: false);
  }
}
