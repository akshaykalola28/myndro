import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/assesment_screen/assesment_start.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class AllAssessmentsNav extends GetView<AssessmentController> {
  static const pageId = "/AllAssessmentsNavigation";

  const AllAssessmentsNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorsConfig.colorBlue,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                }),
          ),
          body: Column(
            children: [
              ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  color: ColorsConfig.colorBlue,
                  height: Get.height * 0.18,
                  width: Get.width,
                  child: SafeArea(
                    child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: Get.height * 0.4,
                            width: Get.width * 0.4,
                            child: Image.asset(
                              ImagePath.myndroWhite,
                              fit: BoxFit.contain,
                            ))),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'A Quick Mental Health Check',
                      style: TextStyle(
                          color: ColorsConfig.colorBlack,
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Our short online mental health evaluations will help you determine if you should seek help from a licensed mental health professional to address mental health issues.',
                        style: TextStyle(
                            color: ColorsConfig.colorGreyy,
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 12.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 200,
                      child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0),
                          itemBuilder: (BuildContext context, int index) {
                            return imgContainer(
                                'Stress Assessment',
                                (() =>
                                    Get.toNamed(AssessmentStartScreen.pageId)));
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      color: ColorsConfig.colorSkyBlue.withOpacity(0.3),
                      width: Get.width,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Myndro is here to help',
                            style: TextStyle(
                                color: ColorsConfig.colorBlack,
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Everyone deserves to be Happy, and if you are seeking for Happiness, we at Myndro are here to help you with the best professionals. Got it, thanks!Received, thank you.\nThanks a lot.',
                              style: TextStyle(
                                  color: ColorsConfig.colorGreyy,
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 12.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorsConfig.colorBlue,
                      ),
                      child: Text(
                        'Get matched today',
                        style: TextStyle(
                            color: ColorsConfig.colorWhite,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget imgContainer(String text, VoidCallback onClick) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      height: Get.height * 0.15,
      width: Get.width * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(ImagePath.onBoard4),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorsConfig.colorWhite,
              fontWeight: FontWeight.bold,
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 15.0),
        ),
      ),
    ),
  );
}
