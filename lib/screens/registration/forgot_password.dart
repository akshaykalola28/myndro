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
      backgroundColor: ColorsConfig.colorBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsConfig.colorBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorsConfig.colorWhite,
          ),
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
          bottom: false,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: ClipPath(
                  clipper: CurvedBottomClipper(),
                  child: Stack(
                    children: [
                      Container(
                        // padding: const EdgeInsets.symmetric(horizontal: 15),
                        color: ColorsConfig.colorWhite,
                        height: Get.height * 0.3,
                        width: Get.width,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              ImagePath.forgotPasswordImg,
                              height: 105,
                              width: 125,
                            )),
                      ),
                      ClipPath(
                        clipper: CurvedBottomClipper(),
                        child: Container(
                          color: ColorsConfig.colorGreen,
                          height: Get.height * 0.18,
                          width: Get.width,
                          padding: const EdgeInsets.only(top: 18),
                          child: Center(
                              child: Text('Forgot Password',
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                    color: ColorsConfig.colorWhite,
                                  ))),
                        ),
                      ),
                      ClipPath(
                        clipper: CurvedBottomClipper(),
                        child: Container(
                          color: ColorsConfig.colorBlue,
                          height: Get.height * 0.05,
                          width: Get.width,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Wrap(
                      children: [
                        Center(
                          child: Text(
                            'Enter your Registration phone number to Reset your password',
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: ColorsConfig.colorWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: loginTextFieldWidget(
                      phoneController,
                      false,
                      Common.validateName,
                      TextInputType.phone,
                      'Phone No',
                      Icons.phone,
                    ),
                  ),
                  const SizedBox(height: 22),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(CreatePasswordScreen.pageId);
                    },
                    child: Container(
                      height: 45,
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(horizontal: 45),
                      decoration: const BoxDecoration(
                        color: ColorsConfig.colorWhite,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Reset Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 16.0,
                            color: ColorsConfig.colorBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Transform.scale(
                    scaleX: -1,
                    child: Image.asset(
                      ImagePath.semiCircleCutted,
                      width: Get.width * 0.98,
                      height: 185,
                      fit: BoxFit.fill,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
