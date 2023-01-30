import 'package:get/get.dart';

import '../controller/controller.dart';

class WebViewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WebViewScreenController>(WebViewScreenController(),
        permanent: false);
  }
}
