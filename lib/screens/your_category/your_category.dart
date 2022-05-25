import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';

class YourCategory extends GetView<YourCategoryController> {
  static const pageId = "/YourCategory";

  const YourCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: RotatedBox(
                    quarterTurns: 10,
                    child: Transform.scale(
                      scaleX: -1,
                      child: Image.asset(
                  ImagePath.semiBlueGreen,
                  fit: BoxFit.fill,
                  height: 165,
                  width: Get.width,
                ),
                    ))),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  Container(
                    width: Get.width,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: ColorsConfig.colorBlue,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Text("I'm a Patient",
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontWeight: FontWeight.w100,
                            fontSize: 20.0,
                            color: ColorsConfig.colorWhite,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(RegistrationScreen.pageId),
                    child: Container(
                      width: Get.width,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: ColorsConfig.colorBlue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text("I'm an Expert",
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontWeight: FontWeight.w100,
                              fontSize: 20.0,
                              color: ColorsConfig.colorWhite,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: Image.asset(
                  ImagePath.semiBlueGreen,
                  fit: BoxFit.fill,
                  height: 165,
                  width: Get.width,
                ))
          ],
        ),
      ),
    );
  }
}
