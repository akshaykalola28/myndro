import 'package:get/get.dart';

import '../controller/controller.dart';

class YourCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<YourCategoryController>(YourCategoryController(), permanent: true);
  }
}
