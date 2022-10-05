import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../model/model.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class EnterPhoneNumber extends GetView<PhoneNumberController> {
  static const pageId = "/EnterPhoneNumber";

  const EnterPhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorsConfig.colorBlue,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: GestureDetector(
              onTap: () {
                Get.focusScope!.unfocus();
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        ClipPath(
                          clipper: CurvedBottomClipper(),
                          child: Container(
                            color: ColorsConfig.colorBlue,
                            height: Get.height * 0.48,
                            width: Get.width,
                            child: Column(
                              children: [
                                Text(
                                  'Enter Your phone Number',
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 25.0,
                                    color: ColorsConfig.colorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'We will send you 6 digit verification code',
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 15.0,
                                    color: ColorsConfig.colorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  height: 38,
                                ),
                                Image.asset(
                                  ImagePath.humanPhone,
                                  height: 190,
                                  width: 240,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              DropdownButtonFormField<CountryData>(
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please Select Country';
                                  }
                                  return null;
                                },
                                iconDisabledColor: ColorsConfig.colorBlue,
                                iconEnabledColor: ColorsConfig.colorBlue,
                                isExpanded: true,
                                iconSize: 0,
                                value: controller.dropdownValue,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  hintText: 'Select',
                                  // labelText: 'Select',
                                  suffixIcon:
                                      const Icon(Icons.keyboard_arrow_down),
                                  iconColor: ColorsConfig.colorBlue,
                                  hintStyle: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 15.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 15.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                ),
                                items: controller.countryListData.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      '${value.countryCode!}  ${value.countryName!}',
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 17.0,
                                        color: ColorsConfig.colorBlue,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (CountryData? newValue) {
                                  controller.dropdownValue = newValue;
                                },
                              ),
                              TextFormField(
                                validator: Common.validatePhoneNo,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsConfig.colorBlue,
                                ),
                                controller: controller.phoneController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  hintText: 'Your Phone number',
                                  hintStyle: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 17.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorsConfig.colorBlack),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorsConfig.colorBlue),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.getOtp(
                                          controller.phoneController.text,
                                          controller
                                              .dropdownValue!.countryCode!);
                                    }
                                  },
                                  child: loginButtonWidget(
                                    'Submit',
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
