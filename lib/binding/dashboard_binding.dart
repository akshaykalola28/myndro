import 'package:get/get.dart';

import '../controller/controller.dart';

class DashboardBinding extends Bindings {
  // @override
  // void dependencies() {
  //   Get.put<dashboardController>(dashboardController(), permanent: false);
  // }
  @override
  void dependencies() {
    Get.put(DashboardController(), permanent: false);
    Get.put(HomeController(), permanent: false);
    // Get.lazyPut<DashboardController>(() => DashboardController());
    // Get.lazyPut<HomeController>(() => HomeController(),);
    Get.lazyPut<RegistrationController>(() => RegistrationController());
    Get.lazyPut<PhoneNumberController>(() => PhoneNumberController());
    Get.lazyPut<AssessmentController>(() => AssessmentController());
  }
}
