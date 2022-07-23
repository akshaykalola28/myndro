import 'package:get/get.dart';

import '../controller/controller.dart';

class OffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OffersController>(OffersController(), permanent: false);
  }
}
