
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

/*class RegistrationScreen extends StatefulWidget {
  static const pageId = "/RegistrationScreen";
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorBlue,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: SafeArea(bottom:false ,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Image.asset(
                  ImagePath.myndroWhite,
                  width: Get.width * 0.95,
                  height: Get.height * 0.2,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height * 0.7,
                  width: Get.width,
                  padding: EdgeInsets.fromLTRB(
                      Get.width * 0.12, Get.width * 0.09, Get.width * 0.12, 0),
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: Get.width * 0.12, vertical: Get.width * 0.09),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    color: ColorsConfig.colorWhite,
                  ),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sign Up',
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 25.0,
                              color: ColorsConfig.colorBlue,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        loginTextFieldWidget(
                          nameController,
                          false,
                          Common.validateName,
                          TextInputType.text,
                          'UserName',
                          Icons.person,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        loginTextFieldWidget(
                          emailController,
                          false,
                          Common.validateEmail,
                          TextInputType.emailAddress,
                          'Email',
                          Icons.email,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        loginTextFieldWidget(
                          mobileController,
                          false,
                          Common.validatePassword,
                          TextInputType.phone,
                          'Phone No',
                          Icons.phone,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        loginTextFieldWidget(
                            passController,
                            true,
                            Common.validatePassword,
                            TextInputType.text,
                            'Password',
                            Icons.lock,
                            Icons.visibility
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        loginTextFieldWidget(
                            passController,
                            true,
                            Common.validatePassword,
                            TextInputType.text,
                            'Confirm Password',
                            Icons.lock,
                            Icons.visibility
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 12,
                                    width: 12,
                                    child: Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor:
                                          ColorsConfig.colorBlue),
                                      child: Checkbox(
                                        focusColor: ColorsConfig.colorBlue,
                                        activeColor: ColorsConfig.colorBlue,
                                        value: selected,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            selected = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('Remember Password',
                                      style: TextStyle(
                                        fontFamily:
                                        AppTextStyle.microsoftJhengHei,
                                        fontSize: 14.0,
                                        color: ColorsConfig.colorBlue,
                                      )),
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(VerificationCodeScreen.pageId);
                          },
                          child: loginButtonWidget('SIGN UP'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 13.0,
                                  color: ColorsConfig.colorGrey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Get.offAndToNamed(LoginScreen.pageId),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 13.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        */ /*  const SizedBox(
                          height: 15,
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
                          height: 5,
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
                        ),*/ /*
                      ],
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
}*/

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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: loginButtonWidget('Submit', () {
                                showDialog(
                                    // barrierDismissible: false,
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
