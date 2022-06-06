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
      Get.toNamed(LoginScreen.pageId);
    }
    else{

      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    }
  }

  List<OnBoardingModel> onBoardingPages=[
    OnBoardingModel(imageAsset: ImagePath.onBoard1,name:"A shoulder to cry on, a space to vent, a person to talk to; all of this is what you can find in a therapist"),
    OnBoardingModel(imageAsset:  ImagePath.onBoard2,name:"We all deserve a space where we can voice our thoughts and feelings without a fear of judgement."),
    OnBoardingModel(imageAsset:  ImagePath.onBoard3,name:"Happiness is a habit-cultivate it. \n-Elbert Hubbard"),
    OnBoardingModel(imageAsset:  ImagePath.onBoard4,name:"Our minds, like our bodies, require nurturing and care. When you can't do it on your own,it's okay to seek help from someone else."),

  ];
}
