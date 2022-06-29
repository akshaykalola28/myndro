import 'package:get/get.dart';

import '../controller/controller.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WalletController>(WalletController(), permanent: false);
  }
}
