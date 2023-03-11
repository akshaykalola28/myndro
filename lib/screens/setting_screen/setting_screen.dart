import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/controller/controller.dart';
import 'package:myndro/screens/screens.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../util/common.dart';

class SettingScreen extends GetView<SettingController> {
  static const pageId = "/SettingScreen";

  SettingScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: LayoutWidget(
          isAssessment: false,
          text: 'Settings',
          body: GestureDetector(
            onTap: () {
              Get.focusScope!.unfocus();
            },
            child: SingleChildScrollView(
              child: Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Login & Security',
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w800,
                              color: ColorsConfig.colorGreyy),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /////TODO CR if needed to change
                        /*   settingTextField(emailController, false,
                        Common.validateName, TextInputType.text, 'Name'),
                    const SizedBox(
                      height: 10,
                    ),
                    settingTextField(emailController, false,
                        Common.validateName, TextInputType.text, 'Email'),
                    const SizedBox(
                      height: 10,
                    ),
                    settingTextField(emailController, false,
                        Common.validateName, TextInputType.text, 'Mobile No'),
                    const SizedBox(
                      height: 10,
                    ), */
                        // settingTextField(emailController, false,
                        //     Common.validateName, TextInputType.text, 'Password'),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: settingTextContainer(
                                'Password : ********',
                                null,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: settingButton(
                                'Change',
                                () {
                                  controller.isChangePass.value =
                                      !controller.isChangePass.value;
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        controller.isChangePass.value
                            ? Form(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    loginTextFieldWidget(
                                      controller.passwordController,
                                      true,
                                      Common.validatePassword,
                                      TextInputType.text,
                                      'Enter Password',
                                      Icons.lock,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    loginTextFieldWidget(
                                      controller.confirmPassController,
                                      true,
                                      (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Re-Enter New Password';
                                        } else if (value.length < 5) {
                                          return 'Password must be a 5 character';
                                        } else if (value !=
                                            controller
                                                .passwordController.text) {
                                          return 'Password must be same as above';
                                        }
                                        return null;
                                      },
                                      TextInputType.text,
                                      'Enter Confirm Password',
                                      Icons.lock,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    controller.isPassLoading.value
                                        ? const MyndroLoader()
                                        : loginButtonWidget(
                                            'Submit',
                                            () {
                                              if (controller
                                                  .formKey.currentState!
                                                  .validate()) {
                                                controller.changePassword();
                                              }
                                            },
                                          ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: settingTextContainer(
                                'Two-Step Verification(2SV) Settings',
                                'Manage your Two Step Verification(2SV) Authenticators',
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: settingButton(
                                  'Edit',
                                  () =>
                                      Get.toNamed(TwoStepVerification.pageId)),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget settingTextField(
//   TextEditingController controller,
//   bool isPassword,
//   FormFieldValidator<String> validator,
//   TextInputType inputType,
//   String hintTxt,
// ) {
//   return TextFormField(
//     onEditingComplete: () {},
//     style: TextStyle(
//       fontFamily: AppTextStyle.microsoftJhengHei,
//       fontSize: 18.0,
//       fontWeight: FontWeight.w400,
//       color: ColorsConfig.colorGreyy,
//     ),
//     controller: controller,
//     obscureText: isPassword,
//     validator: validator,
//     keyboardType: inputType,
//     decoration: InputDecoration(
//       contentPadding:
//           const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
//       hintText: hintTxt,
//       hintStyle: TextStyle(
//         fontFamily: AppTextStyle.microsoftJhengHei,
//         fontSize: 18.0,
//         color: ColorsConfig.colorGreyy,
//       ),
//       filled: true,
//       fillColor: ColorsConfig.colorWhite,
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: ColorsConfig.colorGreyy),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(
//           color: ColorsConfig.colorGreyy,
//           width: 1.0,
//         ),
//       ),
//     ),
//   );
// }
Widget settingButton(String text, VoidCallback onClick) {
  return ElevatedButton(
    onPressed: onClick,
    style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ColorsConfig.colorWhite,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        // fixedSize: const Size(300, 100),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              50,
            ),
            side: const BorderSide(
              width: 1.0,
              color: ColorsConfig.colorBlue,
            ))),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 16.0,
          color: ColorsConfig.colorBlue,
        ),
      ),
    ),
  );
}

Widget settingTextContainer(
  String text,
  String? subtext,
) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
    decoration: BoxDecoration(
      color: ColorsConfig.colorWhite,
      border: Border.all(color: ColorsConfig.colorGreyy, width: 1.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 18.0,
              color: ColorsConfig.colorGreyy,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          subtext != null
              ? Text(
                  subtext,
                  style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    color: ColorsConfig.colorGrey,
                  ),
                )
              : Container(),
        ],
      ),
    ),
  );
}
