import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/controller/controller.dart';
import 'package:myndro/screens/screens.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../util/common.dart';

class SettingScreen extends GetView<SettingController> {
  static const pageId = "/SettingScreen";

  SettingScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: LayoutWidget(
          isAssessment: false,
          text: 'Settings',
          body: GestureDetector(
            onTap: () {
              Get.focusScope!.unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Login & Security',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: ColorsConfig.colorGreyy),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  settingTextField(emailController, false, Common.validateName,
                      TextInputType.text, 'Name'),
                  const SizedBox(
                    height: 10,
                  ),
                  settingTextField(emailController, false, Common.validateName,
                      TextInputType.text, 'Email'),
                  const SizedBox(
                    height: 10,
                  ),
                  settingTextField(emailController, false, Common.validateName,
                      TextInputType.text, 'Mobile No'),
                  const SizedBox(
                    height: 10,
                  ),
                  settingTextField(emailController, false, Common.validateName,
                      TextInputType.text, 'Password'),
                  const SizedBox(
                    height: 10,
                  ),
                  settingTextContainer(
                      'Two-Step Verification(2SV) Settings',
                      'Manage your Two Step Verification(2SV) Authenticators',
                      () => Get.toNamed(TwoStepVerification.pageId))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget settingTextField(
  TextEditingController controller,
  bool isPassword,
  FormFieldValidator<String> validator,
  TextInputType inputType,
  String hintTxt,
) {
  return TextFormField(
    style: TextStyle(
      fontFamily: AppTextStyle.microsoftJhengHei,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: ColorsConfig.colorGreyy,
    ),
    controller: controller,
    obscureText: isPassword,
    validator: validator,
    keyboardType: inputType,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
      hintText: hintTxt,
      hintStyle: TextStyle(
        fontFamily: AppTextStyle.microsoftJhengHei,
        fontSize: 18.0,
        color: ColorsConfig.colorGreyy,
      ),
      filled: true,
      fillColor: ColorsConfig.colorWhite,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorsConfig.colorGreyy),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: ColorsConfig.colorGreyy,
          width: 1.0,
        ),
      ),
    ),
  );
}

Widget settingTextContainer(String text, String SubText, VoidCallback onClick) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      decoration: BoxDecoration(
        color: ColorsConfig.colorWhite,

        border: Border.all(color: ColorsConfig.colorGreyy, width: 1.0),
        borderRadius: const BorderRadius.all(
            Radius.circular(10.0)), // Set rounded corner radius
        // Make rounded corner of border
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 18.0,
                color: ColorsConfig.colorGreyy,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              SubText,
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 15.0,
                color: ColorsConfig.colorGrey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
