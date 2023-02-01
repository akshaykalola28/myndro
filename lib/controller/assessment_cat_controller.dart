import 'dart:convert';

import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class AssessmentCatController extends BaseController {
  dynamic getMeetDetails;
  @override
  void errorHandler(e) {}
  RxBool isLoading = false.obs;
  List<AssessmentCat> assessmentCatList = <AssessmentCat>[].obs;
  @override
  void onInit() async {
    super.onInit();
    getAllAssessmentCat();
  }

  void getAllAssessmentCat() async {
    bool status = await Common.checkInternetConnection();

    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.assessmentCategory();
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        assessmentCatList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          assessmentCatList.add(AssessmentCat.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
