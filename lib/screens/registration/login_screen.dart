import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsConfig.colorBlue,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            bottom: false,
            child: GestureDetector(
              onTap: () {
                Get.focusScope!.unfocus();
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height * 0.65,
                  width: Get.width,
                  margin: EdgeInsets.fromLTRB(
                      Get.width * 0.06, 0, Get.width * 0.06, Get.width * 0.23),
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.06, vertical: Get.width * 0.06),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorsConfig.colorWhite,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expert Login',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 25.0,
                                color: ColorsConfig.colorBlue,
                              )),
                          const SizedBox(
                            height: 35,
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
                            height: 30,
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
                            height: 30,
                          ),
                          loginButtonWidget('SIGN IN'),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: ()=>Get.toNamed(ForgotPasswordScreen.pageId),
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
                            height: 10,
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
                          SizedBox(height: Get.height * 0.05,),
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
                                    color: ColorsConfig.colorGrey,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: ()=>Get.toNamed(YourCategory.pageId),
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      fontFamily: AppTextStyle.microsoftJhengHei,
                                      fontSize: 15.0,
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
              ),
            )));
  }
}
