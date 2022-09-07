import '../util/common.dart';
import 'controller.dart';

class DashboardController extends BaseController {
  @override
  void errorHandler(e) {}
  var tabIndex = 0;

  @override
  void onInit() {
    var retrieved = Common.retrievePrefData(Common.strLoginRes);
    print(retrieved);
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
