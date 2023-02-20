import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class AssessmentEndScreen extends GetView<AssessmentController> {
  static const pageId = "/AssessmentEndScreen";

  AssessmentEndScreen({Key? key}) : super(key: key);
  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: LayoutWidget(
          body: isLoading.value
              ? controller.isCompleted.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 0.38,
                          child: SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                  showLabels: false,
                                  showAxisLine: false,
                                  showTicks: false,
                                  minimum: 0,
                                  maximum: 99,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                        startValue: 0,
                                        endValue: 33,
                                        color: const Color(0xFF00AB47),
                                        label:
                                            'Mild\n${controller.assessmentQueList.length - controller.assessmentQueList.length}-${controller.assessmentQueList.length - controller.assessmentQueList.length + 3}',
                                        sizeUnit: GaugeSizeUnit.factor,
                                        labelStyle: GaugeTextStyle(
                                            fontFamily:
                                                AppTextStyle.microsoftJhengHei,
                                            fontSize: 20),
                                        startWidth: 0.65,
                                        endWidth: 0.65),
                                    GaugeRange(
                                      startValue: 33,
                                      endValue: 66,
                                      color: const Color(0xFFFFBA00),
                                      label:
                                          'Moderate\n${controller.assessmentQueList.length - controller.assessmentQueList.length + 4}-${controller.assessmentQueList.length - 4}',
                                      labelStyle: GaugeTextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 20),
                                      startWidth: 0.65,
                                      endWidth: 0.65,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    ),
                                    GaugeRange(
                                      startValue: 66,
                                      endValue: 99,
                                      color: const Color(0xFFFE2A25),
                                      label:
                                          'Severe\n${controller.assessmentQueList.length - 3}-${controller.assessmentQueList.length}',
                                      labelStyle: GaugeTextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 20),
                                      sizeUnit: GaugeSizeUnit.factor,
                                      startWidth: 0.65,
                                      endWidth: 0.65,
                                    ),
                                  ],
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                        value: (controller.yesCount.value * 10))
                                  ])
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 5),
                          child: Text(
                              'Your ${controller.getAssessmentData['assessmentData'].questionName} score is ${controller.yesCount}/${controller.assessmentQueList.length} ',
                              style: TextStyle(
                                  color: ColorsConfig.colorBlack,
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 5),
                          child: Text(
                              'These symptoms are usual but with the help of therapy these symptoms can be reduced and you can learn how to be in charge of your life.',
                              style: TextStyle(
                                  color: ColorsConfig.colorGreyy,
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 13.0),
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                          child: const Text('Similar Experts'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              foregroundColor: ColorsConfig.colorWhite,
                              elevation: 0,
                              backgroundColor: ColorsConfig.colorBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 3),
                              textStyle: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: ColorsConfig.colorBlack,
                              )),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 5),
                          child: Text(
                              'Please hang on while \nwe analyze your answers.',
                              style: TextStyle(
                                  color: ColorsConfig.colorGreyy,
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          ImagePath.assessmentImg,
                          height: Get.height * 0.18,
                        ),
                      ],
                    )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagePath.assessmentImg,
                      height: Get.height * 0.18,
                      // height: Get.height * 0.3,
                      // width: Get.width * 0.2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 5),
                      child: Text(
                          'Thank you for taking the time to complete your Panic Disorder personal assessment.',
                          style: TextStyle(
                              color: ColorsConfig.colorGreyy,
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: const Text('Submit Assessment'),
                      onPressed: () {
                        isLoading.value = !isLoading.value;
                        Timer(const Duration(seconds: 3), controller.goToEnd);
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: ColorsConfig.colorWhite,
                          elevation: 0,
                          backgroundColor: ColorsConfig.colorBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 3),
                          textStyle: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: ColorsConfig.colorBlack,
                          )),
                    ),
                  ],
                ),
          text:
              'Myndro ${controller.getAssessmentData['assessmentData'].questionName} Test',
          isAssessment: true,
          isAssessBack: () => Get.offAllNamed(DashboardScreen.pageId),
        ),
      );
    }));
  }
}
