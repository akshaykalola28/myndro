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
              height: 20,
            ),
            Text('Please Select Your Category',
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontWeight: FontWeight.w100,
                  fontSize: 22.0,
                  color: ColorsConfig.colorBlue,
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.toNamed(PsycologistDropdown.pageId),
                        child: Container(
                          width: Get.width,
                          height: 52.0,
                          decoration: BoxDecoration(
                              color: ColorsConfig.colorWhite,
                              // borderRadius: BorderRadius.circular(10.0),
                              border:
                                  Border.all(color: ColorsConfig.colorBlue)),
                          child: Center(
                            child: Text(
                                'Physcologist'
                                /* controller.doctorcategoryList[index]
                                          .doctorCategoryName ??
                                      '' */
                                ,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 20.0,
                                  color: ColorsConfig.colorBlue,
                                )),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 25,
                        ),
                    itemCount: 15)),
          ],
        ));
  }
}
