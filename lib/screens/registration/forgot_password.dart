import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../constant/constant.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  static const pageId = "/ForgotPasswordScreen";

  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.05),
                  Text('Forgot Password',
                      style: TextStyle(
                        fontFamily: AppTextStyle.poppinsMedium,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.colorBlue,
                      )),
                  const SizedBox(height: 15),
                  Wrap(
                    children: [
                      Text('We just need your register e-mail ID to send reset link',
                          style: TextStyle(
                            fontFamily: AppTextStyle.poppinsMedium,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: ColorsConfig.colorHintText,
                          ),),
                    ],
                  ),
                  const SizedBox(height: 15),
                  loginTextFieldWidget(
                      emailController,
                      false,
                      Common.validateEmail,
                      TextInputType.emailAddress,
                      'E-Mail'
                  ),
                  const SizedBox(height: 27),
                  loginButtonWidget('Reset Password')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}