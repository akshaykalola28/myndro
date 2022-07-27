import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class UserRegistration extends StatefulWidget {
  static const pageId = "/UserRegistration";

  const UserRegistration({Key? key}) : super(key: key);

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final TextEditingController passController = TextEditingController();
  String? dropdownValue;
  bool addVisibility = false;
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      resizeToAvoidBottomInset: false,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipPath(
                        clipper: CurvedBottomClipper(),
                        child: Container(
                          color: ColorsConfig.colorBlue,
                          height: Get.height * 0.21,
                          width: Get.width,
                          child: SafeArea(
                            child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    height: Get.height * 0.4,
                                    width: Get.width * 0.4,
                                    child: Image.asset(
                                      ImagePath.myndroWhite,
                                      fit: BoxFit.contain,
                                    ))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: ColorsConfig.colorBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          'Profile Details',
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: ColorsConfig.colorWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                    top: 220,
                    child: Container(
                      height: Get.height,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            profileTextFieldWidget(
                              passController,
                              Common.validatePassword,
                              TextInputType.text,
                              'First Name',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            profileTextFieldWidget(
                              passController,
                              Common.validatePassword,
                              TextInputType.text,
                              'Last Name',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            profileTextFieldWidget(
                              passController,
                              Common.validateEmail,
                              TextInputType.emailAddress,
                              'DOB',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            DropDownWidget(
                              dropdownValue: dropdownValue,
                              hintText: 'Gender',
                              isExpanded: true,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            profileTextFieldWidget(
                                passController,
                                Common.validatePassword,
                                TextInputType.multiline,
                                'Address', () {
                              setState(() {
                                addVisibility = !addVisibility;
                              });
                            }, Icons.add),
                            Visibility(
                              visible: addVisibility,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  profileTextFieldWidget(
                                    passController,
                                    Common.validatePassword,
                                    TextInputType.multiline,
                                    'Address Line 1',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            DropDownWidget(
                              dropdownValue: dropdownValue,
                              hintText: 'Country',
                              isExpanded: true,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            DropDownWidget(
                              dropdownValue: dropdownValue,
                              hintText: 'state',
                              isExpanded: true,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            DropDownWidget(
                              dropdownValue: dropdownValue,
                              hintText: 'City',
                              isExpanded: true,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            DropDownWidget(
                              dropdownValue: dropdownValue,
                              hintText: 'Zipcode',
                              isExpanded: true,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            profileTextFieldWidget(
                              passController,
                              Common.validateEmail,
                              TextInputType.emailAddress,
                              'Password',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            profileTextFieldWidget(
                              passController,
                              Common.validateEmail,
                              TextInputType.emailAddress,
                              'Confirm Password',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // FlutterPasswordStrength(
                            //     password: _password,
                            //     strengthCallback: (strength) {
                            //       debugPrint(strength.toString());
                            //     }),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: loginButtonWidget('Submit', () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) {
                                      return AnimatedDialog(
                                        outputText: 'Congratulations',
                                        subText:
                                            'Your Account has Created Successfully.',
                                        titleSubtext: '  ',
                                        onClose: () {
                                          Get.offAllNamed(
                                              DashboardScreen.pageId);
                                        },
                                      );
                                      // Timer(const Duration(seconds: 3), goToDashboard);
                                    });
                              }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            )),
      ),
    );
  }

  void goToDashboard() async {
    return Get.toNamed(DashboardScreen.pageId);
  }
}
