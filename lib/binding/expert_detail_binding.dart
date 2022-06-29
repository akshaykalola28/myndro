import 'package:get/get.dart';
import 'package:myndro/controller/controller.dart';

class ExpertDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertDetailController>(ExpertDetailController(), permanent: false);
  }
}
