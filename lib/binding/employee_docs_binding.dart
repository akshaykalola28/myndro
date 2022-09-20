import 'package:get/get.dart';

import '../controller/controller.dart';

class EmployeeDocsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EmployeeDocsController>(EmployeeDocsController(), permanent: false);
  }
}
