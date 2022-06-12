import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';
import 'package:myndro/widgets/login_button_widget.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';

class VerificationCodeScreen extends GetView<RegistrationController> {
  static const pageId = "/verification_code";

  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MediaQuery.of(context).viewInsets.bottom == 0
            ? ColorsConfig.colorBlue
            : ColorsConfig.colorBlue,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerWidget(context),
            const SizedBox(height: 20),
            bodyContent(context),
          ],
        ),
      ),
    );
  }

  Widget headerWidget(context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Get.width * 0.6),
          bottomRight: Radius.circular(Get.width * 0.6),
        ),
        color: MediaQuery.of(context).viewInsets.bottom == 0
            ? ColorsConfig.colorBlue
            : ColorsConfig.colorBlue,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Text(
              'Enter 6-digit\nVerification Code',
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 25.0,
                fontWeight: FontWeight.w100,
                color: ColorsConfig.colorWhite,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              MediaQuery.of(context).viewInsets.bottom == 0
                  ? ImagePath.verification1
                  : ImagePath.verification2,
              height: Get.height * 0.25,
              width: Get.width * 0.42,
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyContent(context) {
    return Column(
      children: [
        if (MediaQuery.of(context).viewInsets.bottom == 0)
          Text(
            'The Verification code was sent to the phone\nnumber +91 998800 0000. please enter the code.',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ColorsConfig.colorBlue),
          ),
        const SizedBox(height: 24),
        OTPTextField(
          length: 6,
          width: Get.width * 0.7,
          style: Theme.of(context).textTheme.bodyLarge!,
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            print("Completed: " + pin);
          },
        ),
        const SizedBox(height: 36),
        Text(
          'Resend Verification Code',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ColorsConfig.colorBlue),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: loginButtonWidget('Submit', () {
            Get.toNamed(UserRegistration.pageId);
          }),
        )
      ],
    );
  }
}
