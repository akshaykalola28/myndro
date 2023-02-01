import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class AssessmentController extends BaseController {
  var pageController = PageController();
  var onPageIndex = 0.obs;
  List<AssessmentQuesList> assessmentQueList = <AssessmentQuesList>[].obs;
  bool get isLastPage => onPageIndex.value == assessmentQueList.length - 1;
  RxBool isCompleted = false.obs;
  RxBool isLoading = false.obs;
  dynamic getAssessmentData;
  @override
  void onInit() async {
    super.onInit();
    getAssessmentData = Get.arguments;
    getAssessmentQuestions(
        getAssessmentData['assessmentData'].questionShortName);
  }

  forward() {
    if (isLastPage) {
      Get.toNamed(AssessmentEndScreen.pageId);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    }
  }

  @override
  void errorHandler(e) {}

  void getAssessmentQuestions(String assessmentCat) async {
    bool status = await Common.checkInternetConnection();
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getAssessmentQuestion(assessmentCat);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        assessmentQueList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          assessmentQueList.add(AssessmentQuesList.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  void goToEnd() async {
    isCompleted.value = !isCompleted.value;
  }
}
