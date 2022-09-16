import '../util/common.dart';
import 'controller.dart';
import 'dart:convert';

class DashboardController extends BaseController {
  @override
  void errorHandler(e) {}
  var tabIndex = 0;

  @override
  void onInit() {
    // var retrieved = Common.retrievePrefData(Common.strLoginRes);
    // print(retrieved);
    getProfileDetails();
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  getProfileDetails() async {
    var res = await Common.retrievePrefData(Common.strLoginRes);
    String accessToken = res.isNotEmpty ? jsonDecode(res)['jwt_token'] : '';
  }
}
