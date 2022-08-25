import 'controller.dart';

class ExpertAppointmentController extends BaseController {
  @override
  void errorHandler(e) {}
  String? dropValue;

  void setSelected(String value) {
    dropValue = value;
    update();
  }

  List sortType = ['Individual', 'Package', 'Audio Call', 'Video Call'];
}
