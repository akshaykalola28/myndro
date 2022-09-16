import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class TwoStepVerification extends GetView<SettingController> {
  static const pageId = "/2StepVerification";

  TwoStepVerification({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool selected = false;
  bool isFrom2StepVerification = true;

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
                    '2 - Step Verification Settings',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: ColorsConfig.colorGreyy),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Login',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: ColorsConfig.colorBlue,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  loginTextFieldWidget(
                    emailController,
                    false,
                    Common.validateEmail,
                    TextInputType.emailAddress,
                    'Email',
                    Icons.person,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  loginTextFieldWidget(
                      passController,
                      true,
                      Common.validatePassword,
                      TextInputType.text,
                      'Password',
                      Icons.lock,
                      Icons.remove_red_eye),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(ForgotPasswordScreen.pageId),
                        child: Text('Forgot Password?',
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontWeight: FontWeight.w100,
                              fontSize: 13.0,
                              color: ColorsConfig.colorBlue,
                            )),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  loginButtonWidget(
                    'SIGN IN',
                    () {} /*  =>
                        Get.toNamed(VerificationCodeScreen.pageId, arguments: {
                      'isFrom2StepVerification': true,
                    }) */
                    ,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
