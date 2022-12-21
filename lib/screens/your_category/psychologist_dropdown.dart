import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class PsycologistDropdown extends GetView<PsycologistDropdownController> {
  static const pageId = "/PsycologistDropdown";

  const PsycologistDropdown({Key? key}) : super(key: key);

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
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.3,
                    ),
                    Theme(
                      data: ThemeData(
                        canvasColor: ColorsConfig.colorBlue,
                      ),
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null) {
                            return 'Please Select !!';
                          } else {
                            return null;
                          }
                        },
                        iconDisabledColor: ColorsConfig.colorBlue,
                        iconEnabledColor: ColorsConfig.colorBlue,
                        isExpanded: true,
                        value: controller.dropdownValue,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 10),
                          hintText: 'Select',
                          hintStyle: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 15.0,
                            color: ColorsConfig.colorWhite,
                          ),
                          filled: true,
                          fillColor: ColorsConfig.colorBlue,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: ColorsConfig.colorBlue,
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: ColorsConfig.colorBlue,
                              width: 1.5,
                            ),
                          ),
                        ),
                        items: (controller.getDoctorCat['category_id'] == '6'
                                ? controller.mentalEx
                                : controller.getDoctorCat['category_id'] == '5'
                                    ? controller.mediMas
                                    : controller.realLife)
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 15.0,
                                color: ColorsConfig.colorWhite,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.dropdownValue = newValue;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          if (controller.formKey.currentState!.validate()) {
                            Get.toNamed(ExpertRegistrationForm.pageId,
                                arguments: {
                                  'is_edit': false,
                                  'category_id':
                                      controller.getDoctorCat['category_id'],
                                  'sub_category_id': '3'
                                });
                          }
                        },
                        child: loginButtonWidget(
                          'Done',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
