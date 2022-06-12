import 'controller.dart';

class dashboardController extends BaseController {
  @override
  void errorHandler(e) {}
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
