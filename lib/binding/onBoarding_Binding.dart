import 'package:get/get.dart';

import '../controller/controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnBoardingController>(OnBoardingController(), permanent: false);
  }
}