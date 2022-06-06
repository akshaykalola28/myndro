import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class SelectExpertise extends GetView<YourCategoryController> {
  static const pageId = "/SelectExpertise";

  const SelectExpertise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: ClipPath(
              clipper: CurvedBottomClipper(),
              child: Container(
                color: ColorsConfig.colorBlue,
                height: Get.height * 0.26,
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
          ),
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: Image.asset(
          //     ImagePath.catTop,
          //     fit: BoxFit.fill,
          //     height: Get.height*0.25,
          //     width: Get.width*0.7,
          //   ),
          // ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.25,
                  ),
                  Text('Please Select Your Category',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontWeight: FontWeight.w100,
                        fontSize: 22.0,
                        color: ColorsConfig.colorBlue,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(PsycologistDropdown.pageId),
                    child: Container(
                      width: Get.width,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: ColorsConfig.colorWhite,
                          // borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: ColorsConfig.colorBlue)
                      ),
                      child: Center(
                        child: Text("Psychologist",
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontWeight: FontWeight.w100,
                              fontSize: 20.0,
                              color: ColorsConfig.colorBlue,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(PsycologistDropdown.pageId),
                    child: Container(
                      width: Get.width,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: ColorsConfig.colorWhite,
                          // borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: ColorsConfig.colorBlue)
                      ),
                      child: Center(
                        child: Text("Psychiatrist",
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontWeight: FontWeight.w100,
                              fontSize: 20.0,
                              color: ColorsConfig.colorBlue,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(PsycologistDropdown.pageId),
                    child: Container(
                      width: Get.width,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: ColorsConfig.colorWhite,
                          // borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: ColorsConfig.colorBlue)
                      ),
                      child: Center(
                        child: Text("Real Life Coach",
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontWeight: FontWeight.w100,
                              fontSize: 20.0,
                              color: ColorsConfig.colorBlue,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          /*   Positioned(
            bottom: 80,
            left: 25,
            child: Image.asset(
              ImagePath.cartoon,
              fit: BoxFit.fill,
              height: Get.height*0.23,
              width: Get.width*0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              ImagePath.catBottom,
              fit: BoxFit.fill,
              height: Get.height*0.25,
              width: Get.width*0.7,
            ),
          )*/
        ],
      ),
    );
  }
}