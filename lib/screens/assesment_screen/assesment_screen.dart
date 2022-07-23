import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/widgets/layout_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class AssessmentScreen extends GetView<AssessmentController> {
  static const pageId = "/AssessmentScreen";

  const AssessmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: LayoutWidget(
          body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.onPageIndex,
            itemCount: controller.questions.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: ColorsConfig.colorLightBlue.withOpacity(0.3),
                        border: Border.all(color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      children: [
                        Expanded(
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 13.0,
                            animation: true,
                            progressColor: ColorsConfig.colorBlue,
                            backgroundColor:
                                ColorsConfig.colorBlue.withOpacity(0.2),
                            percent: (100 / controller.questions.length) *
                                (index + 1) /
                                100,
                            center: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          controller.questions[index].name,
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                            color: ColorsConfig.colorBlack,
                          ),
                          maxLines: 6,
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                child: const Text('Yes'),
                                onPressed: () {
                                  controller.forward();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: ColorsConfig.colorWhite,
                                    onPrimary: ColorsConfig.colorBlack,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 3),
                                    textStyle: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsConfig.colorBlack,
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                child: const Text('No'),
                                onPressed: () {
                                  controller.forward();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: ColorsConfig.colorWhite,
                                    onPrimary: ColorsConfig.colorBlack,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 3),
                                    textStyle: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsConfig.colorBlack,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 22,
                    child: Image.asset(
                      ImagePath.panicImg,
                      width: Get.width * 0.35,
                    ),
                  )
                ],
              );
            },
          ),
          text: 'Myndro Panic Disorder Test',
          isAssessment: true),
    ));
  }
}
