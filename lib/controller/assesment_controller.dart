import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/model.dart';
import '../screens/screens.dart';
import 'controller.dart';

class AssessmentController extends BaseController {
  var pageController = PageController();
  var onPageIndex = 0.obs;

  bool get isLastPage => onPageIndex.value == questions.length - 1;
  RxBool isCompleted = false.obs;

  forward() {
    if (isLastPage) {
      Get.toNamed(AssessmentEndScreen.pageId);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    }
  }

  @override
  void errorHandler(e) {}
  List<OnBoardingModel> questions = [
    OnBoardingModel(
        imageAsset: ImagePath.onBoard1,
        name:
            "Do you face a trouble concentrating Do you face a trouble concentrating on things, such as reading the newspaper or watc things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watcDo you face a trouble concentrating on things, such as reading the newspaper or watching television"),
    OnBoardingModel(
        imageAsset: ImagePath.onBoard1,
        name:
            "Do you face a trouble concentrating on things, such as reading the newspaper or watching television"),
    OnBoardingModel(
        imageAsset: ImagePath.onBoard1,
        name:
            "Do you face a trouble concentrating on things, such as reading the newspaper or watching television"),
    OnBoardingModel(
        imageAsset: ImagePath.onBoard1,
        name:
            "Do you face a trouble concentrating on things, such as reading the newspaper or watching television"),
    OnBoardingModel(
        imageAsset: ImagePath.onBoard1,
        name:
            "Do you face a trouble concentrating on things, such as reading the newspaper or watching television"),
  ];

  void goToEnd() async {
    isCompleted.value = !isCompleted.value;
  }
}
