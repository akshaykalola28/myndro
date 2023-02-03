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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Obx(() => Scaffold(
            body: LayoutWidget(
              isAssessment: false,
              text: 'Settings',
              body: SingleChildScrollView(
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
                      controller.emailController,
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
                        controller.passController,
                        true,
                        Common.validatePassword,
                        TextInputType.visiblePassword,
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
                    controller.isLoginLoading.value
                        ? const MyndroLoader()
                        : loginButtonWidget(
                            'SIGN IN',
                            () => controller
                                .checkLoginPass(), /*  =>
                      Get.toNamed(VerificationCodeScreen.pageId, arguments: {
                    'isFrom2StepVerification': true,
                  }) */
                          ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
