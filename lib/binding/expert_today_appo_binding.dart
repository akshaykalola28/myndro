import 'package:get/get.dart';
import '../controller/controller.dart';

class ExpertTodayAppoBinidng extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertTodayAppoController>(ExpertTodayAppoController(),
        permanent: false);
  }
}
