import 'package:get/get.dart';

import 'base_controller.dart';

class PhoneNumberController extends BaseController {
  @override
  void errorHandler(e) {}
  String? dropdownValue;
  List listType = ['abc', 'def', 'ghi'];

  void setSelected(String value) {
    dropdownValue = value;
    update();
  }
}
