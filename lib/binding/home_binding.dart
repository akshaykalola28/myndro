import 'package:get/get.dart';
import 'package:myndro/controller/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: false);
  }
}
