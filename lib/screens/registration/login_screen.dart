import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/controller/controller.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  static const pageId = "/LoginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final LoginController loginController = LoginController();
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
                child: ClipPath(
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
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: Container(
                  height: Get.height * 0.68,
                  width: Get.width * 0.92,
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.06, vertical: Get.width * 0.06),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.height * 0.045),
                    color: ColorsConfig.colorWhite,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login',
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 25.0,
                              color: ColorsConfig.colorBlue,
                            )),
                        const SizedBox(
                          height: 30,
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 12,
                                    width: 12,
                                    child: Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor:
                                              ColorsConfig.colorBlue),
                                      child: Checkbox(
                                        focusColor: ColorsConfig.colorBlue,
                                        activeColor: ColorsConfig.colorBlue,
                                        value: loginController
                                            .rememberPassSelected,
                                        onChanged: (_) {
                                          setState(() {
                                            loginController
                                                    .rememberPassSelected =
                                                !loginController
                                                    .rememberPassSelected;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('Remember Password',
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 14.0,
                                        color: ColorsConfig.colorBlue,
                                      )),
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        loginButtonWidget(
                          'SIGN IN',
                          () {
                            loginController.login(emailController.text.trim(), passController.text.trim());
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () =>
                                  Get.toNamed(ForgotPasswordScreen.pageId),
                              child: Text('Forgot Password?',
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 13.0,
                                    color: ColorsConfig.colorBlue,
                                  )),
                            )),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width * 0.32,
                              height: 1,
                              color: ColorsConfig.colorBlue,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Or',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorBlue,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: Get.width * 0.32,
                              height: 1,
                              color: ColorsConfig.colorBlue,
                            ),
                          ],
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
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Log in with Google',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
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
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Log in with Facebook',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorBlue,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color: ColorsConfig.colorGreyy,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(YourCategory.pageId),
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              // Positioned(
              //     bottom: 0,
              //     right: 0,
              //     child: Container(child: Image.asset(ImagePath.cornerGreenBlue,width: Get.width*0.9,height: 300,fit: BoxFit.fill,))),
            ],
          ),
        ));
  }
}
