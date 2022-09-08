import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class VerificationCodeScreen extends GetView<RegistrationController> {
  static const pageId = "/verification_code";

  VerificationCodeScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      appBar: controller.fromOtpScreen[1]
          ? PreferredSize(
              preferredSize: const Size.fromHeight(-40.0), child: Container())
          : AppBar(
              elevation: 0,
              backgroundColor: MediaQuery.of(context).viewInsets.bottom == 0
                  ? ColorsConfig.colorBlue
                  : ColorsConfig.colorBlue,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
      body: controller.fromOtpScreen[1]
          ? LayoutWidget(
              body: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '2 - Step Verification Settings',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: ColorsConfig.colorGreyy),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  bodyContent(context),
                ],
              ),
              text: 'Settings',
              isAssessment: false,
            )
          : SingleChildScrollView(
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
    return Form(
      key: formKey,
      child: Column(
        children: [
          if (MediaQuery.of(context).viewInsets.bottom == 0)
            Text(
              'The Verification code was sent to the phone\nnumber ${controller.fromOtpScreen[0]['patient_phone_no']} . please enter the code.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorsConfig.colorBlue),
            ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                activeColor: Colors.grey,
                selectedColor: ColorsConfig.colorBlue,
                inactiveColor: Colors.grey,
                shape: PinCodeFieldShape.underline,
                activeFillColor: Colors.transparent,
              ),
              validator: (v) {
                if (v!.length < 6) {
                  return "Please enter all digits";
                } else {
                  return null;
                }
              },
              errorAnimationDuration: 2,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: false,
              keyboardType: TextInputType.number,
              controller: controller.otpController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
              appContext: context,
            ),
          ),
          const SizedBox(height: 36),
          GestureDetector(
            onTap: () {
              controller.otpController.clear();
              controller.resendOtp(
                  controller.fromOtpScreen[2],
                  controller.fromOtpScreen[3],
                  controller.fromOtpScreen[0]['patient_id']);
            },
            child: Text(
              'Resend Verification Code',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorsConfig.colorBlue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: loginButtonWidget('Submit', () {
              formKey.currentState?.validate();
              if (controller.otpController != '') {
                controller.verifyOtp(controller.fromOtpScreen[0]['patient_id'],
                    controller.otpController.text);
              }
            }),
          )
        ],
      ),
    );
  }
}
