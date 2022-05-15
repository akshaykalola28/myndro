import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: ColorsConfig.colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsConfig.colorWhite,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorsConfig.colorBackButton,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () {
            Get.focusScope!.unfocus();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
            child: Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.06),
                  Text('Login',
                      style: TextStyle(
                        fontFamily: AppTextStyle.poppinsMedium,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.colorBlue,
                      )),
                  const SizedBox(height: 25),
                  loginTextFieldWidget(
                      emailController,
                      false,
                      Common.validateEmail,
                      TextInputType.emailAddress,
                      'E-Mail'
                  ),
                  const SizedBox(height: 20),
                  loginTextFieldWidget(
                      passController,
                      true,
                      Common.validatePassword,
                      TextInputType.emailAddress,
                      'Password'
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: selected ? ColorsConfig.colorFocusedBorder : ColorsConfig.colorWhite,

                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: selected ? const Icon(
                                Icons.check,
                                size: 13.0,
                                color: ColorsConfig.colorWhite,
                              ) : Container()
                          ),
                        ),
                      ),
                      const SizedBox(width: 12,),
                      Text('Remember',style: TextStyle(
                        fontFamily: AppTextStyle.poppinsMedium,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: ColorsConfig.colorHintText,
                      ),),
                      const Spacer(),
                      Text('Forgot Password ?',style: TextStyle(
                        fontFamily: AppTextStyle.poppinsMedium,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: ColorsConfig.colorHintText,
                      ),),
                    ],
                  ),
                  const SizedBox(height: 25),
                  loginButtonWidget('Login'),
                  const SizedBox(height: 25),
                  Center(
                    child: Text('Or',style: TextStyle(
                      fontFamily: AppTextStyle.poppinsMedium,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: ColorsConfig.colorHintText,
                    ),),
                  ),
                  const SizedBox(height: 20),
                    Row(
                      children: [
                        socialButtonWidget(ImagePath.facebookLogo,ImagePath.facebook),
                       SizedBox(width: 15,),
                        socialButtonWidget(ImagePath.googleLogo,ImagePath.google),
                      ],
                  ),

                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have Account ? " ,style: TextStyle(
                          fontFamily: AppTextStyle.poppinsMedium,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: ColorsConfig.colorHintText,
                        ),),
                        Text("Create Account" ,style: TextStyle(
                          fontFamily: AppTextStyle.poppinsMedium,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: ColorsConfig.colorBlue,
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.028,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


