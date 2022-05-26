import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  static const pageId = "/RegistrationScreen";

  RegistrationScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorBlue,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                ImagePath.semiGreenBlue,
                width: Get.width * 0.95,
                height: Get.height * 0.2,
                fit: BoxFit.fill,
              ),
            ),
            SafeArea(
              bottom: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height * 0.75,
                  width: Get.width,
                  padding: EdgeInsets.fromLTRB(
                      Get.width * 0.12, Get.width * 0.09, Get.width * 0.12, 0),
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: Get.width * 0.12, vertical: Get.width * 0.09),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    color: ColorsConfig.colorWhite,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Create account',
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 25.0,
                              color: ColorsConfig.colorBlue,
                            )),
                        const SizedBox(
                          height: 35,
                        ),
                        loginTextFieldWidget(
                          nameController,
                          false,
                          Common.validateName,
                          TextInputType.text,
                          'UserName',
                          Icons.person,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        loginTextFieldWidget(
                          emailController,
                          false,
                          Common.validateEmail,
                          TextInputType.emailAddress,
                          'Email',
                          Icons.email,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        loginTextFieldWidget(
                          mobileController,
                          false,
                          Common.validatePassword,
                          TextInputType.phone,
                          'Phone No',
                          Icons.phone,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        loginTextFieldWidget(
                          passController,
                          true,
                          Common.validatePassword,
                          TextInputType.text,
                          'Password',
                          Icons.lock,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        loginButtonWidget('SIGN UP'),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 13.0,
                                  color: ColorsConfig.colorGrey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Get.offAndToNamed(LoginScreen.pageId),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 13.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagePath.googleLogo,
                              height: 23,
                              width: 23,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Log in with Google',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              ImagePath.facebookLogo,
                              height: 22,
                              width: 22,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Log in with Facebook',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
