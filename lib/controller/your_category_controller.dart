import 'dart:convert';

import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'base_controller.dart';

class YourCategoryController extends BaseController {
  @override
  void errorHandler(e) {}
  String? dropdownValue;
  var doctorcategoryList = <Doctorcategory>[].obs;
  @override
  void onInit() {
    super.onInit();
    getExpertCategoryList();
  }

  void getExpertCategoryList() async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      var response = await RemoteServices.getExpertCategoryList();
      var jsonData = json.decode(response.body)["data"];
      var data = jsonData["doctorcategory"] as List;
      if (response.statusCode == 200) {
        for (dynamic i in data) {
          doctorcategoryList.add(Doctorcategory.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
