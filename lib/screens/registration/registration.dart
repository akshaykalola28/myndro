import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../model/model.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

/*class UserRegistration extends GetView<RegistrationController> {
  static const pageId = "/UserRegistration";

   UserRegistration({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
          onTap: () {
            Get.focusScope!.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ColorsConfig.colorBlue,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  }),
            ),
            body: Stack(
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
                          height: Get.height * 0.18,
                          width: Get.width,
                          child: SafeArea(
                            child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    height: Get.height * 0.5,
                                    width: Get.width * 0.5,
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
                    top: 210,
                    child: Form(
                      key: formKey,
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
                                controller.firstNameController,
                                Common.validateName,
                                TextInputType.text,
                                'First Name',
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              profileTextFieldWidget(
                                controller.lastNameController,
                                Common.validateName,
                                TextInputType.text,
                                'Last Name',
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              profileTextFieldWidget(
                                controller.emailController,
                                Common.validateEmail,
                                TextInputType.text,
                                'Email',
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              // profileTextFieldWidget(
                              //   controller.dobController,
                              //   Common.validateEmail,
                              //   TextInputType.emailAddress,
                              //   'DOB',
                              // ),
                              const SizedBox(
                                height: 12,
                              ),
                              //     DropDownWidget(
                              //   dropdownValue: dropdownValue,
                              //   hintText: 'Gender',
                              //   isExpanded: true,
                              // ),
                              DropdownButtonFormField<String>(
                                iconDisabledColor: ColorsConfig.colorBlue,
                                iconEnabledColor: ColorsConfig.colorBlue,
                                isExpanded: true,
                                value: controller.genderDropdownValue,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 10),
                                  hintText: 'Gender',
                                  labelText: 'Gender',
                                  hintStyle: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 15.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 15.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                  filled: true,
                                  fillColor: ColorsConfig.colorWhite,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      color: ColorsConfig.colorBlue,
                                      width: 1.5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      color: ColorsConfig.colorBlue,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                items: <String>[
                                  'Male',
                                  'Female'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 13.0,
                                        color: ColorsConfig.colorBlue,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  controller.genderDropdownValue = newValue;
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              profileTextFieldWidget(
                                  controller.addLine1Controller,
                                  Common.validateAddress,
                                  TextInputType.multiline,
                                  'Address', () {
                                controller.addVisibility =
                                    !controller.addVisibility;
                              }, Icons.add),
                              Visibility(
                                visible: controller.addVisibility,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    profileTextFieldWidget(
                                      controller.addLine2Controller,
                                      Common.validateAddress,
                                      TextInputType.multiline,
                                      'Address Line 1',
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    profileTextFieldWidget(
                                      controller.addLine3Controller,
                                      Common.validateAddress,
                                      TextInputType.multiline,
                                      'Address Line 2',
                                    ),
                                  ],
                                ),
                              ),
                              //TODO uncomment this
                              // const SizedBox(
                              //   height: 12,
                              // ),
                              // DropDownWidget<CountryData>(
                              //     isExpanded: true,
                              //     items: controller.countryListData,
                              //     texts: controller.countryListData
                              //         .map((e) => '${e.countryCode}  ${e.countryName}')
                              //         .toList(),
                              //     onChanged: (newValue) {
                              //       controller.countryDropdown = newValue;
                              //       controller.getStateList(newValue?.countryId ?? '');
                              //     },
                              //     hintText: 'Country',
                              //   ),
                              //
                              // const SizedBox(
                              //   height: 12,
                              // ),
                              // DropDownWidget<StateData>(
                              //   isExpanded: true,
                              //   items: controller.stateListData,
                              //   texts: controller.stateListData
                              //       .map((e) => '${e.stateId} ')
                              //       .toList(),
                              //   onChanged: (newValue) {
                              //     controller.stateDropdown = newValue;
                              //     controller.getCityList(newValue?.stateId ?? '');
                              //   },
                              //   hintText: 'State',
                              // ),
                              // const SizedBox(
                              //   height: 12,
                              // ),
                              // DropDownWidget<CityData>(
                              //   isExpanded: true,
                              //   items: controller.cityListData,
                              //   texts: controller.cityListData
                              //       .map((e) => '${e.cityName} ')
                              //       .toList(),
                              //   onChanged: (newValue) {
                              //     controller.cityDropdown = newValue;
                              //   },
                              //   hintText: 'City',
                              // ),
                              // DropDownWidget(
                              //   dropdownValue: dropdownValue,
                              //   hintText: 'Country',
                              //   isExpanded: true,
                              // ),
                              */ /*   const SizedBox(
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


                             */ /*
                              */ /* const SizedBox(
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
*/ /*
                              const SizedBox(
                                height: 12,
                              ),
                              profileTextFieldWidget(
                                controller.zipCodeController,
                                Common.validateZipcode,
                                TextInputType.number,
                                'Zipcode',
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              profileTextFieldWidget(
                                controller.passController,
                                Common.validatePassword,
                                TextInputType.visiblePassword,
                                'Password',
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              profileTextFieldWidget(
                                controller.confirmPassController,
                                (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter valid Password!!!';
                                  } else if (value.length < 6) {
                                    return 'Password must be a 6 character';
                                  } else if (value !=
                                      controller.passController.text) {
                                    return "Password must be same as above";
                                  }
                                  return null;
                                },
                                TextInputType.visiblePassword,
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
                                  print('object');

                                  if (formKey.currentState!
                                      .validate()) {
                                    controller.addPatient(
                                        context,
                                        controller.firstNameController.text,
                                        controller.lastNameController.text,
                                        controller.emailController.text,
                                        '17-08-2022',
                                        controller.addLine1Controller.text,
                                        '',
                                        '',
                                        103,
                                        12,
                                        13,
                                        controller.zipCodeController.text,
                                        controller.confirmPassController.text,
                                        controller.genderDropdownValue!);
                                  }

                                  */ /*   showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) {
                                      return AnimatedDialog(
                                        outputText: 'Congratulations',
                                        subText:
                                            'Your Account has Created Successfully.',
                                        titleSubtext: '  ',
                                        onClose: () {
                                          Get.offAllNamed(DashboardScreen.pageId);
                                        },
                                      );
                                      // Timer(const Duration(seconds: 3), goToDashboard);
                                    }); */ /*
                                }),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }

  void goToDashboard() async {
    return Get.toNamed(DashboardScreen.pageId);
  }
}*/

class UserRegistration extends GetView<RegistrationController> {
  static const pageId = "/UserRegistration";

  const UserRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
          backgroundColor: ColorsConfig.colorWhite,
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: ColorsConfig.colorBlue,
          //   leading: IconButton(
          //       icon: const Icon(Icons.arrow_back),
          //       onPressed: () {
          //         Get.back();
          //       }),
          // ),
          body: Column(
            children: [
              ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  color: ColorsConfig.colorBlue,
                  height: Get.height * 0.25,
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
              Expanded(child: Obx(() {
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(12, 20, 12, 0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        profileTextFieldWidget(
                          controller.firstNameController,
                          Common.validateName,
                          TextInputType.text,
                          'First Name',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        profileTextFieldWidget(
                          controller.lastNameController,
                          Common.validateName,
                          TextInputType.text,
                          'Last Name',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        profileTextFieldWidget(
                          controller.emailController,
                          Common.validateEmail,
                          TextInputType.text,
                          'Email',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () => controller.selectDob(context),
                          child: Container(
                            // width: Get.width,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(
                                  color: ColorsConfig.colorBlue, width: 1.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.formattedDob.value,
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 15.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: ColorsConfig.colorBlue,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        DropDownWidget<String>(
                          hintText: 'Gender',
                          isExpanded: true,
                          items: controller.genderList,
                          texts: controller.genderList.map((e) => e).toList(),
                          onChanged: (newValue) {
                            controller.genderDropdownValue = newValue;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        profileTextFieldWidget(
                            controller.addLine1Controller,
                            Common.validateAddress,
                            TextInputType.multiline,
                            'Address', () {
                          controller.addVisibility.value =
                              !controller.addVisibility.value;
                        }, Icons.add),
                        Visibility(
                          visible: controller.addVisibility.value,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              profileTextFieldWidget(
                                controller.addLine2Controller,
                                null,
                                TextInputType.multiline,
                                'Address Line 1',
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              profileTextFieldWidget(
                                controller.addLine3Controller,
                                null,
                                TextInputType.multiline,
                                'Address Line 2',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        DropDownWidget<CountryData>(
                          isExpanded: true,
                          items: controller.countryListData,
                          texts: controller.countryListData
                              .map((e) => '${e.countryCode}  ${e.countryName}')
                              .toList(),
                          onChanged: (newValue) {
                            controller.countryDropdown = newValue;
                            controller.getStateList(newValue?.countryId ?? '');
                          },
                          hintText: 'Country',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        DropDownWidget<StateData>(
                          isExpanded: true,
                          items: controller.stateListData,
                          texts: controller.stateListData
                              .map((e) => '${e.stateId} ')
                              .toList(),
                          onChanged: (newValue) {
                            controller.stateDropdown = newValue;
                            controller.getCityList(newValue?.stateId ?? '');
                          },
                          hintText: 'State',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        DropDownWidget<CityData>(
                          isExpanded: true,
                          items: controller.cityListData,
                          texts: controller.cityListData
                              .map((e) => '${e.cityName} ')
                              .toList(),
                          onChanged: (newValue) {
                            controller.countryId = newValue!.countryId ?? '';
                            controller.cityDropdown = newValue;
                          },
                          hintText: 'City',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        profileTextFieldWidget(
                          controller.zipCodeController,
                          Common.validateZipcode,
                          TextInputType.number,
                          'Zipcode',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        profileTextFieldWidget(
                          controller.passController,
                          Common.validatePassword,
                          TextInputType.visiblePassword,
                          'Password',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        profileTextFieldWidget(
                          controller.confirmPassController,
                          (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid Password!!!';
                            } else if (value.length < 6) {
                              return 'Password must be a 6 character';
                            } else if (value != controller.passController.text) {
                              return "Password must be same as above";
                            }
                            return null;
                          },
                          TextInputType.visiblePassword,
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
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: loginButtonWidget('Submit', () {
                              print('object');

                              if (controller.formKey.currentState!.validate()) {
                                controller.addPatient(
                                    context,
                                    controller.firstNameController.text.trim(),
                                    controller.lastNameController.text.trim(),
                                    controller.emailController.text.trim(),
                                    controller.formattedDob.value,
                                    controller.addLine1Controller.text.trim(),
                                    controller.addLine2Controller.text.trim(),
                                    controller.addLine3Controller.text.trim(),
                                    '103',
                                    12,
                                    13,
                                    controller.zipCodeController.text.trim(),
                                    controller.confirmPassController.text.trim(),
                                    controller.genderDropdownValue!);

                                /*   showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (_) {
                                        return AnimatedDialog(
                                          outputText: 'Congratulations',
                                          subText:
                                              'Your Account has Created Successfully.',
                                          titleSubtext: '  ',
                                          onClose: () {
                                            Get.offAllNamed(DashboardScreen.pageId);
                                          },
                                        );
                                        // Timer(const Duration(seconds: 3), goToDashboard);
                                      }); */

                              }
                            })),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              }))
            ],
          )),
    );
  }
}
