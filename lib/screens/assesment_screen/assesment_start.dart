import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/constant/constant.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class AssessmentStartScreen extends GetView<AssessmentController> {
  static const pageId = "/AssessmentStartScreen";

  const AssessmentStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: LayoutWidget(
          body: Column(
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
              Text(
                'About the Test',
                style: TextStyle(
                    color: ColorsConfig.colorBlue,
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: ColorsConfig.colorLightBlue.withOpacity(0.4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  "Through this test result, you'll learn more about your symptoms. You can approach our mental health professionals at Myndro and have a talk with them.",
                  style: TextStyle(
                      fontFamily: AppTextStyle.madleyBold,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: const Text('Get Started'),
                onPressed: () {
                  Get.toNamed(AssessmentScreen.pageId);
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: ColorsConfig.colorBlue,
                    onPrimary: ColorsConfig.colorWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                    textStyle: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: ColorsConfig.colorBlack,
                    )),
              ),
            ],
          ),
          text: 'Myndro Panic Disorder Test',
          isAssessment: true),
    ));
  }
}
