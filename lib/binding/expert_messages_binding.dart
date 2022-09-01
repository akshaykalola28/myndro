import 'package:get/get.dart';

import '../controller/controller.dart';

class ExpertMessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ExpertMessagesController>(ExpertMessagesController(),
        permanent: false);
  }
}
