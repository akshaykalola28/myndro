import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../constant/constant.dart';
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
          onPressed: () {},
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Wrap(
                  children: [
                    Center(
                      child: Text('Enter your Registration phone number to Reset your password',
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: ColorsConfig.colorWhite,
                          ),),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: loginTextFieldWidget(
                  phoneController,
                    false,
                    Common.validateName,
                    TextInputType.phone,
                    'Phone No', Icons.phone,
                ),
              ),
              const SizedBox(height: 35),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}