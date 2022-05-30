import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../constant/constant.dart';
import '../model/model.dart';

class OnBoardingController extends GetxController {
  var onPageIndex = 0.obs;
  bool get isLastPage => onPageIndex.value == onBoardingPages.length - 1;
  var pageController = PageController();

  forward() {
    if (isLastPage) {
      //go to Dashboard
      Get.toNamed(YourCategory.pageId);
    } else {
      pageController.nextPage(
          duration: 300.milliseconds, curve: Curves.bounceOut);
    }
  }

  List<OnBoardingModel> onBoardingPages = [
    OnBoardingModel(imageAsset: ImagePath.onBoard1, name: 'Image Hola'),
    OnBoardingModel(imageAsset: ImagePath.onBoard2, name: 'Image Second'),
    OnBoardingModel(imageAsset: ImagePath.onBoard3, name: 'Image Third'),
    OnBoardingModel(imageAsset: ImagePath.onBoard4, name: 'Image Third'),
  ];
}
