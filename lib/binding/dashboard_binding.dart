import 'package:get/get.dart';

import '../controller/controller.dart';

class DashboardBinding extends Bindings {
  // @override
  // void dependencies() {
  //   Get.put<dashboardController>(dashboardController(), permanent: false);
  // }
  @override
  void dependencies() {
    Get.lazyPut<dashboardController>(() => dashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RegistrationController>(() => RegistrationController());
    Get.lazyPut<PhoneNumberController>(() => PhoneNumberController());
  }
}
