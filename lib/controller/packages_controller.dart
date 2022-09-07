import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/model.dart';
import 'controller.dart';

class PackagesController extends BaseController {
  @override
  void errorHandler(e) {}
  RxInt radioSelected = 1.obs;
  String? radioVal;
  final TextEditingController titleController = TextEditingController();
  final CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;

  List<OnBoardingModel> sliderPages = [
    OnBoardingModel(imageAsset: ImagePath.pack1, name: 'Module based learning'),
    OnBoardingModel(imageAsset: ImagePath.pack2, name: '100% Safe and Secure'),
    OnBoardingModel(imageAsset: ImagePath.pack3, name: 'Offline Workshop'),
    OnBoardingModel(
        imageAsset: ImagePath.pack4, name: 'Completely Customizable'),
    OnBoardingModel(imageAsset: ImagePath.pack5, name: '24/7 Helpline Number '),
    OnBoardingModel(imageAsset: ImagePath.pack6, name: 'Personalized Help'),
  ];

  List<OnBoardingModel> dataList = [
    OnBoardingModel(
        imageAsset: 'Creating a safe space',
        name:
            '- While conducting group sessions with the staff, our counsellors ensure that they provide a safe and non-judgmental space.'),
    OnBoardingModel(
        imageAsset: 'Giving a platform to open up',
        name:
            '- During the meetings, each employee is given a platform and the opportunity to voice their concerns and respectfully listen to the  struggles of others.'),
    OnBoardingModel(
        imageAsset: 'Providing personalised help',
        name:
            ' People who wish to participate in one-on-one counselling sessions with our therapists get chance to do so'),
    OnBoardingModel(
        imageAsset: 'Better service to the patients',
        name:
            '- Happiness positively impacts on the quality and productivity of individuals, teams and the organisation.'),
    OnBoardingModel(
        imageAsset: 'Save more time',
        name:
            '- Reductions in the financial costs of sickness, turnover, poor productivity, incivility, employee claims and benefits.'),
    OnBoardingModel(
        imageAsset: 'Help for all',
        name:
            ' - The Happy Helpline is available 24/7 not just for the employees, but also for their family members.'),
  ];
}
