import 'controller.dart';

class ExpertDetailController extends BaseController {
  @override
  void errorHandler(e) {}
  String? dropdownValue;
  List listType = ['abc', 'def', 'ghi'];

  void setSelected(String value) {
    dropdownValue = value;
    update();
  }
}
