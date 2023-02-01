import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/registration/create_password.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';

import '../../util/common.dart';
import '../../widgets/widgets.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  static const pageId = "/ForgotPasswordScreen";

  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsConfig.colorBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsConfig.colorWhite,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsConfig.colorBlue,
              size: 30,
            )),
      ),
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: Column(
          children: [
            ClipPath(
              clipper: CurvedBottomClipper(),
              child: Container(
                color: ColorsConfig.colorWhite,
                height: Get.height * 0.25,
                width: Get.width,
                child: SafeArea(
                  child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: Get.height * 0.4,
                          width: Get.width * 0.4,
                          child: Image.asset(
                            ImagePath.myndroBlue,
                            fit: BoxFit.contain,
                          ))),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.height * 0.06),
                    padding: EdgeInsets.fromLTRB(Get.width * 0.06,
                        Get.width * 0.06, Get.width * 0.06, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.height * 0.045),
                      color: ColorsConfig.colorWhite,
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text('Forgot Password?',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 25.0,
                                  color: ColorsConfig.colorBlue,
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            controller.isOtpChecked.value
                                ? Column(
                                    children: [
                                      loginTextFieldWidget(
                                        controller.passwordController,
                                        false,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'Enter Password',
                                        Icons.lock,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      loginTextFieldWidget(
                                        controller.confirmPassController,
                                        false,
                                        (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Re-Enter New Password';
                                          } else if (value.length < 6) {
                                            return 'Password must be a 6 character';
                                          } else if (value !=
                                              controller
                                                  .passwordController.text) {
                                            return 'Password must be same as above';
                                          }
                                          return null;
                                        },
                                        TextInputType.text,
                                        'Enter Confirm Password',
                                        Icons.lock,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      loginButtonWidget(
                                        'Submit',
                                        () {
                                          if (controller.formKey.currentState!
                                              .validate()) {
                                            controller.updateForgotPass();
                                          }
                                        },
                                      )
                                    ],
                                  )
                                : Column(
                                    children: [
                                      loginTextFieldWidget(
                                        controller.phoneNoController,
                                        false,
                                        Common.validatePhoneNo,
                                        TextInputType.number,
                                        'Registered Mobile No.',
                                        Icons.phone,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      controller.ischeckOtp.value
                                          ? loginTextFieldWidget(
                                              controller.otpConfirmController,
                                              false,
                                              Common.validateOTP,
                                              TextInputType.number,
                                              'Enter OTP',
                                              Icons.lock,
                                            )
                                          : Container(),
                                      Row(
                                        children: [
                                          const Text("I'm a User"),
                                          Radio(
                                            value: 1,
                                            groupValue:
                                                controller.radioSelected.value,
                                            activeColor: ColorsConfig.colorBlue,
                                            onChanged: (value) {
                                              controller.radioSelected.value =
                                                  value as int;
                                            },
                                          ),
                                          const Spacer(),
                                          const Text("I'm an Expert"),
                                          Radio(
                                            value: 2,
                                            groupValue:
                                                controller.radioSelected.value,
                                            activeColor: ColorsConfig.colorBlue,
                                            onChanged: (value) {
                                              controller.radioSelected.value =
                                                  value as int;
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      controller.ischeckOtp.value
                                          ? loginButtonWidget(
                                              'Confirm OTP',
                                              () {
                                                if (controller
                                                    .formKey.currentState!
                                                    .validate()) {
                                                  controller
                                                      .checkForgotPassOTP();
                                                }
                                              },
                                            )
                                          : loginButtonWidget(
                                              'Send OTP',
                                              () {
                                                if (controller
                                                    .formKey.currentState!
                                                    .validate()) {
                                                  controller
                                                      .sendForgotPassOTP();
                                                }
                                              },
                                            ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
