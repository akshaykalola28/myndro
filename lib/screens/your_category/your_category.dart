import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class YourCategory extends GetView<YourCategoryController> {
  static const pageId = "/YourCategory";

  const YourCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsConfig.colorBlue,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: ClipPath(
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
          ),
          /*Positioned(
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
              ),
            ),
          ),*/
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Please Select Your Category',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0,
                        color: ColorsConfig.colorBlue,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(EnterPhoneNumber.pageId),
                    child: Container(
                      width: Get.width,
                      height: 52.0,
                      decoration: const BoxDecoration(
                        color: ColorsConfig.colorBlue,
                        // borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text("I'm a User",
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontWeight: FontWeight.w100,
                              fontSize: 20.0,
                              color: ColorsConfig.colorWhite,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(SelectExpertise.pageId),
                    child: Container(
                      width: Get.width,
                      height: 52.0,
                      decoration: const BoxDecoration(
                        color: ColorsConfig.colorBlue,
                        // borderRadius: BorderRadius.circular(15.0),
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
          ),
          // Positioned(
          //   bottom: 0,
          //   child: Image.asset(
          //     ImagePath.semiBlueGreen,
          //     fit: BoxFit.fill,
          //     height: 165,
          //     width: Get.width,
          //   ),
          // )
        ],
      ),
    );
  }
}
