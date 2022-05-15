import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final TextEditingController conPassController = TextEditingController();


  String? validateConfirmPassword(String? value) {
    if (value!.trim() != passController.text.trim()) {
      return 'Password Mismatch !!!';
    }
    return null;
  }

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
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.05),
                  Text('Registration',
                      style: TextStyle(
                        fontFamily: AppTextStyle.poppinsMedium,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.colorBlue,
                      )),
                  const SizedBox(height: 17),
                  loginTextFieldWidget(
                    nameController,
                    false,
                    Common.validateName,
                    TextInputType.text,
                    'Name'
                  ),
                  const SizedBox(height: 20),
                  loginTextFieldWidget(
                      emailController,
                      false,
                      Common.validateEmail,
                      TextInputType.emailAddress,
                      'E-Mail'
                  ),
                  const SizedBox(height: 20),
                  loginTextFieldWidget(
                      mobileController,
                      false,
                      Common.validateName,
                      TextInputType.number,
                      'Mobile Number'
                  ),
                  const SizedBox(height: 20),
                  loginTextFieldWidget(
                      passController,
                      true,
                      Common.validatePassword,
                      TextInputType.text,
                      'Password'
                  ),
                  const SizedBox(height: 20),
                  loginTextFieldWidget(
                      conPassController,
                      true,
                      validateConfirmPassword,
                      TextInputType.text,
                      'Confirm Password'
                  ),
                  const SizedBox(height: 40),
                  loginButtonWidget('Register')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
