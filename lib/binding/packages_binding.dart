import 'package:get/get.dart';

import '../controller/controller.dart';

class PackagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PackagesController>(PackagesController(), permanent: false);
  }
}
