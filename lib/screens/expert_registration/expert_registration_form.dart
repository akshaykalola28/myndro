import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/controller/controller.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../constant/constant.dart';
import '../../model/model.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class ExpertRegistrationForm extends StatefulWidget {
  static const pageId = "/ExpertRegistrationScreen";

  const ExpertRegistrationForm({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ExpertRegistrationFormState createState() => _ExpertRegistrationFormState();
}

class _ExpertRegistrationFormState extends State<ExpertRegistrationForm> {
  final _stepsText = ['Profile', 'Degree', 'Bank', 'GST', 'KYC', 'Agreement'];
  bool addVisibility = false;
  final _stepCircleRadius = 12.0;

  final _stepProgressViewHeight = 100.0;

  final Color _activeColor = ColorsConfig.colorBlue;

  final Color _inactiveColor = Colors.grey;

  final TextStyle _headerStyle =
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  final TextStyle _stepStyle =
      const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold);

  Size? _safeAreaSize;

  int _curPage = 1;
  dynamic fromEdit;
  final RegistrationController _registrationController =
      RegistrationController();

  @override
  void initState() {
    super.initState();
    fromEdit = Get.arguments;
  }

  var pageController = PageController();
  StepProgressView _getStepProgress() {
    return StepProgressView(
      _stepsText,
      _curPage,
      _stepProgressViewHeight,
      _safeAreaSize!.width,
      _stepCircleRadius,
      _activeColor,
      _inactiveColor,
      _headerStyle,
      _stepStyle,
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.only(
        top: 0.0,
        left: 18.0,
        right: 18.0,
      ),
      onTap: () {},
    );
  }

  final TextEditingController passController = TextEditingController();
  bool status = false;
  int _radioSelected = 1;
  String? dropdownValue;
  int? showIndex = 1;
  bool selected = false;
  forward() {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    setState(() {
      _curPage = _curPage + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    _safeAreaSize = mediaQD.size;
    return Scaffold(
        backgroundColor: ColorsConfig.colorWhite,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.focusScope!.unfocus();
            },
            child: Stack(
              children: [
                fromEdit
                    ? Column(
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
                            height: 20,
                          ),
                          ExpertAppbar(
                            text: 'Expert Profile (Mandatory)',
                            onDrawerClick: () {
                              Get.back();
                            },
                            leadingIcon: Icons.arrow_back,
                          ),
                        ],
                      )
                    : Positioned(
                        top: 0,
                        child: ClipPath(
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
                      ),

                Positioned.fill(
                  top: fromEdit ? 215 : 200,
                  child: SizedBox(
                    height: Get.height,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 80.0, child: _getStepProgress()),
                        Expanded(
                          child: PageView(
                            controller: pageController,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              Container(
                                color: ColorsConfig.colorWhite,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .firstNameController,
                                        Common.validateName,
                                        TextInputType.name,
                                        'First Name',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .lastNameController,
                                        Common.validateName,
                                        TextInputType.name,
                                        'Last Name',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .contactController,
                                        Common.validatePhoneNo,
                                        TextInputType.phone,
                                        'Contact',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController.emailController,
                                        Common.validateEmail,
                                        TextInputType.emailAddress,
                                        'Email',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      GestureDetector(
                                        onTap: () => _registrationController
                                            .selectDob(context),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                                color: ColorsConfig.colorBlue,
                                                width: 1.5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                _registrationController
                                                    .formattedDob.value,
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 15.0,
                                                  color: ColorsConfig.colorBlue,
                                                ),
                                              ),
                                              const Icon(
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
                                        items:
                                            _registrationController.genderList,
                                        texts: _registrationController
                                            .genderList
                                            .map((e) => e)
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .genderDropdownValue = newValue;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                          _registrationController
                                              .addLine1Controller,
                                          Common.validateAddress,
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
                                              _registrationController
                                                  .addLine2Controller,
                                              null,
                                              TextInputType.multiline,
                                              'Address Line 1',
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            profileTextFieldWidget(
                                              _registrationController
                                                  .addLine3Controller,
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
                                        // validator: (value) {
                                        //   if (value == null) {
                                        //     return 'Please Select Country';
                                        //   }
                                        //   return null;
                                        // },
                                        isExpanded: true,
                                        items: _registrationController
                                            .countryListData,
                                        texts: _registrationController
                                            .countryListData
                                            .map((e) =>
                                                '${e.countryCode}  ${e.countryName}')
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .countryDropdown = newValue;
                                          _registrationController.getStateList(
                                              newValue?.countryId ?? '');
                                        },
                                        hintText: 'Country',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DropDownWidget<StateData>(
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please Select State';
                                          }
                                          return null;
                                        },
                                        isExpanded: true,
                                        items: _registrationController
                                            .stateListData,
                                        texts: _registrationController
                                            .stateListData
                                            .map((e) => '${e.stateId} ')
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .stateDropdown = newValue;
                                          _registrationController.getCityList(
                                              newValue?.stateId ?? '');
                                        },
                                        hintText: 'State',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DropDownWidget<CityData>(
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please Select City';
                                          }
                                          return null;
                                        },
                                        isExpanded: true,
                                        items: _registrationController
                                            .cityListData,
                                        texts: _registrationController
                                            .cityListData
                                            .map((e) => '${e.cityName} ')
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController.cityDropdown =
                                              newValue;
                                        },
                                        hintText: 'City',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .zipCodeController,
                                        Common.validateZipcode,
                                        TextInputType.number,
                                        'Zipcode',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                          _registrationController
                                              .passController,
                                          Common.validatePassword,
                                          TextInputType.text,
                                          'Password', () {
                                        setState(() {
                                          _registrationController
                                                  .passwordVisible.value =
                                              !_registrationController
                                                  .passwordVisible.value;
                                        });
                                      },
                                          _registrationController
                                                  .passwordVisible.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          _registrationController
                                              .passwordVisible.value),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                          _registrationController
                                              .confirmPassController,
                                          (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter valid Password!!!';
                                            } else if (value.length < 6) {
                                              return 'Password must be a 6 character';
                                            } else if (value !=
                                                _registrationController
                                                    .passController.text) {
                                              return "Password must be same as above";
                                            }
                                            return null;
                                          },
                                          TextInputType.text,
                                          'Confirm Password',
                                          () {
                                            setState(() {
                                              _registrationController
                                                      .confirmPasswordVisible
                                                      .value =
                                                  !_registrationController
                                                      .confirmPasswordVisible
                                                      .value;
                                            });
                                          },
                                          _registrationController
                                                  .confirmPasswordVisible.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          _registrationController
                                              .confirmPasswordVisible.value),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      loginButtonWidget(
                                        'Next',
                                        () {
                                          forward();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: ColorsConfig.colorWhite,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DropDownWidget<String>(
                                        // validator: (value) {
                                        //   if (value?.isEmpty == true) {
                                        //     return 'Please Select Gender';
                                        //   }
                                        //   return null;
                                        // },
                                        hintText: 'Medical Master',
                                        isExpanded: true,
                                        items: const ['abc', 'xyz', 'mmm'],
                                        texts: ['abc', 'xyz', 'mmm']
                                            .map((e) => e)
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .dropdownValue = newValue;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .degreeNameController,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'Degree Name',
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .degreeYearController,
                                        (value) {
                                          if (value?.isEmpty == true) {
                                            return '';
                                          }
                                          return null;
                                        },
                                        TextInputType.number,
                                        'Degree Year',
                                      ),
                                      /* DropDownWidget<String>(
                                        // validator: (value) {
                                        //   if (value?.isEmpty == true) {
                                        //     return 'Please Select Gender';
                                        //   }
                                        //   return null;
                                        // },
                                        hintText: 'Degree Year',
                                        isExpanded: true,
                                        items: const ['abc', 'xyz', 'mmm'],
                                        texts: ['abc', 'xyz', 'mmm']
                                            .map((e) => e)
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .dropdownValue = newValue;
                                        },
                                      ), */
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Common.attachDocWidget(
                                          _registrationController
                                              .degreeCerti.value, () async {
                                        _registrationController.pickeddegree =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: [
                                            'jpg',
                                            'pdf',
                                            'png',
                                            'jpeg'
                                          ],
                                        );
                                        if (_registrationController
                                                .pickeddegree !=
                                            null) {
                                          File file = File(
                                              _registrationController
                                                      .pickeddegree
                                                      ?.files
                                                      .single
                                                      .path ??
                                                  '');
                                          setState(() {
                                            _registrationController
                                                    .degreeCerti.value =
                                                file.path.split('/').last;
                                          });
                                        } else {
                                          // User canceled the picker
                                        }
                                      }),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .practiceCertiNoController,
                                        (value) {
                                          if (value?.isEmpty == true) {
                                            return '';
                                          }
                                          return null;
                                        },
                                        TextInputType.text,
                                        'Practice Certificate No',
                                      ),
                                      /*DropDownWidget(
                                        dropdownValue: dropdownValue,
                                        hintText: 'Practice Certificate No',
                                        isExpanded: true,
                                      ),*/
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Common.attachDocWidget(
                                          _registrationController
                                              .practiceCerti.value, () async {
                                        _registrationController
                                                .pickedPracticeCerti =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: [
                                            'jpg',
                                            'pdf',
                                            'png',
                                            'jpeg'
                                          ],
                                        );
                                        if (_registrationController
                                                .pickedPracticeCerti !=
                                            null) {
                                          File file = File(
                                              _registrationController
                                                      .pickedPracticeCerti
                                                      ?.files
                                                      .single
                                                      .path ??
                                                  '');
                                          setState(() {
                                            _registrationController
                                                    .practiceCerti.value =
                                                file.path.split('/').last;
                                          });
                                        } else {
                                          // User canceled the picker
                                        }
                                      }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      loginButtonWidget(
                                        'Next',
                                        () {
                                          forward();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: ColorsConfig.colorWhite,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DropDownWidget<String>(
                                        // validator: (value) {
                                        //   if (value?.isEmpty == true) {
                                        //     return 'Please Select Gender';
                                        //   }
                                        //   return null;
                                        // },
                                        hintText: 'Bank Name',
                                        isExpanded: true,
                                        items: const ['abc', 'xyz', 'mmm'],
                                        texts: ['abc', 'xyz', 'mmm']
                                            .map((e) => e)
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .dropdownValue = newValue;
                                        },
                                      ),
                                      /*DropDownWidget(
                                        dropdownValue: dropdownValue,
                                        hintText: 'Bank Name',
                                        isExpanded: true,
                                      ),*/
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .holderNameController,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'Account Holder Name',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .accNumberController,
                                        Common.validatePassword,
                                        TextInputType.number,
                                        'Account Number',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DropDownWidget<String>(
                                        // validator: (value) {
                                        //   if (value?.isEmpty == true) {
                                        //     return 'Please Select Gender';
                                        //   }
                                        //   return null;
                                        // },
                                        hintText: 'Account Type',
                                        isExpanded: true,
                                        items: const ['abc', 'xyz', 'mmm'],
                                        texts: ['abc', 'xyz', 'mmm']
                                            .map((e) => e)
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .dropdownValue = newValue;
                                        },
                                      ),
                                      /*DropDownWidget(
                                        dropdownValue: dropdownValue,
                                        hintText: 'Account Type',
                                        isExpanded: true,
                                      ),*/
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .ifscCodeController,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'IFSC Code',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                          _registrationController
                                              .branchAddController,
                                          Common.validatePassword,
                                          TextInputType.multiline,
                                          'Branch Address', () {
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
                                              _registrationController
                                                  .branchAdd1Controller,
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
                                      DropDownWidget<String>(
                                        // validator: (value) {
                                        //   if (value?.isEmpty == true) {
                                        //     return 'Please Select Gender';
                                        //   }
                                        //   return null;
                                        // },
                                        hintText: 'Country',
                                        isExpanded: true,
                                        items: const ['abc', 'xyz', 'mmm'],
                                        texts: ['abc', 'xyz', 'mmm']
                                            .map((e) => e)
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .dropdownValue = newValue;
                                        },
                                      ),
                                      /*DropDownWidget(
                                        dropdownValue: dropdownValue,
                                        hintText: 'Country',
                                        isExpanded: true,
                                      ),*/
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DropDownWidget<String>(
                                        // validator: (value) {
                                        //   if (value?.isEmpty == true) {
                                        //     return 'Please Select Gender';
                                        //   }
                                        //   return null;
                                        // },
                                        hintText: 'State',
                                        isExpanded: true,
                                        items: const ['abc', 'xyz', 'mmm'],
                                        texts: ['abc', 'xyz', 'mmm']
                                            .map((e) => e)
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .dropdownValue = newValue;
                                        },
                                      ),
                                      /*DropDownWidget(
                                        dropdownValue: dropdownValue,
                                        hintText: 'state',
                                        isExpanded: true,
                                      ),*/
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DropDownWidget<String>(
                                        // validator: (value) {
                                        //   if (value?.isEmpty == true) {
                                        //     return 'Please Select Gender';
                                        //   }
                                        //   return null;
                                        // },
                                        hintText: 'City',
                                        isExpanded: true,
                                        items: const ['abc', 'xyz', 'mmm'],
                                        texts: ['abc', 'xyz', 'mmm']
                                            .map((e) => e)
                                            .toList(),
                                        onChanged: (newValue) {
                                          _registrationController
                                              .dropdownValue = newValue;
                                        },
                                      ),
                                      /*DropDownWidget(
                                        dropdownValue: dropdownValue,
                                        hintText: 'City',
                                        isExpanded: true,
                                      ),*/
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .branchZipController,
                                        Common.validateZipcode,
                                        TextInputType.number,
                                        'Zipcode',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Common.attachDocWidget(
                                          _registrationController
                                              .cancelCheque.value, () async {
                                        _registrationController.pickedCheque =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: [
                                            'jpg',
                                            'pdf',
                                            'png',
                                            'jpeg'
                                          ],
                                        );
                                        if (_registrationController
                                                .pickedCheque !=
                                            null) {
                                          File file = File(
                                              _registrationController
                                                      .pickedCheque
                                                      ?.files
                                                      .single
                                                      .path ??
                                                  '');
                                          setState(() {
                                            _registrationController
                                                    .cancelCheque.value =
                                                file.path.split('/').last;
                                          });
                                        } else {
                                          // User canceled the picker
                                        }
                                      }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      loginButtonWidget(
                                        'Next',
                                        () {
                                          forward();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: ColorsConfig.colorWhite,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 50,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          color: ColorsConfig.colorBlue,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          border: Border.all(
                                            color: ColorsConfig.colorBlue,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Are you register under GST?',
                                            style: TextStyle(
                                              fontFamily: AppTextStyle
                                                  .microsoftJhengHei,
                                              fontSize: 16.0,
                                              color: ColorsConfig.colorWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ToggleSwitch(
                                        fontSize: 20,
                                        minWidth: 60.0,
                                        minHeight: 38,
                                        cornerRadius: 25.0,
                                        activeBgColors: const [
                                          [ColorsConfig.colorBlue],
                                          [ColorsConfig.colorBlue]
                                        ],
                                        activeFgColor: Colors.white,
                                        inactiveBgColor:
                                            ColorsConfig.colorLightBlue,
                                        inactiveFgColor: Colors.black,
                                        initialLabelIndex: 1,
                                        totalSwitches: 2,
                                        labels: const ['No', 'yes'],
                                        radiusStyle: true,
                                        onToggle: (index) {
                                          print('switched to: $index');

                                          print('showIndex to: $showIndex');
                                          setState(() {
                                            showIndex = index;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      if (showIndex == 1)
                                        Column(
                                          children: [
                                            profileTextFieldWidget(
                                              _registrationController
                                                  .gstNoController,
                                              Common.validatePassword,
                                              TextInputType.text,
                                              'GST No',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                color: ColorsConfig.colorWhite,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                border: Border.all(
                                                  color: ColorsConfig.colorBlue,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'upload Your copy of GST Registration Certificate ',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 17.0,
                                                        color: ColorsConfig
                                                            .colorBlue,
                                                      ),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.attach_file,
                                                    size: 35,
                                                    color:
                                                        ColorsConfig.colorBlue,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 12,
                                                  width: 12,
                                                  child: Theme(
                                                    data: ThemeData(
                                                        unselectedWidgetColor:
                                                            ColorsConfig
                                                                .colorBlue),
                                                    child: Checkbox(
                                                      focusColor: ColorsConfig
                                                          .colorBlue,
                                                      activeColor: ColorsConfig
                                                          .colorBlue,
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
                                                Expanded(
                                                  child: Text(
                                                      'I hereby solemnly affirm and declare that the information given herein above is true and correct to the best of my knowledge and belief, and nothing has been concealed therefrom. ',
                                                      style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 12.0,
                                                        color: ColorsConfig
                                                            .colorGreyy,
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      else
                                        Column(
                                          children: [
                                            Container(
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                color: ColorsConfig.colorWhite,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                border: Border.all(
                                                  color: ColorsConfig.colorBlue,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'Fill the necessary details and attach\n your digital signature in below\n attached self-declaration. ',
                                                    style: TextStyle(
                                                      fontFamily: AppTextStyle
                                                          .microsoftJhengHei,
                                                      fontSize: 15.0,
                                                      color: ColorsConfig
                                                          .colorGreyy,
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 12,
                                                  width: 12,
                                                  child: Theme(
                                                    data: ThemeData(
                                                        unselectedWidgetColor:
                                                            ColorsConfig
                                                                .colorBlue),
                                                    child: Checkbox(
                                                      focusColor: ColorsConfig
                                                          .colorBlue,
                                                      activeColor: ColorsConfig
                                                          .colorBlue,
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
                                                Expanded(
                                                  child: Text(
                                                      'Yes, I understand and agree with the self declaration terms.',
                                                      style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 12.0,
                                                        color: ColorsConfig
                                                            .colorGreyy,
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      /* showIndex == 0 ?
                                      Container(
                                        height: 75,
                                        width: Get.width,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: ColorsConfig.colorBlue,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: ColorsConfig.colorBlue,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Fill the necessary details and attach\n your digital signature in below\n attached self-declaration. ',
                                              style: TextStyle(
                                                fontFamily: AppTextStyle
                                                    .microsoftJhengHei,
                                                fontSize: 16.0,
                                                color: ColorsConfig.colorWhite,
                                              ),
                                              maxLines: 3,
                                            ),
                                            const Icon(
                                              Icons.attach_file,
                                              size: 35,
                                              color: ColorsConfig.colorWhite,
                                            ),
                                          ],
                                        ),
                                      ) : Container(),
                                      const SizedBox(
                                        height: 15,
                                      ),*/
                                      loginButtonWidget(
                                        'Next',
                                        () {
                                          forward();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: ColorsConfig.colorWhite,
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController
                                            .aadharNoController,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'Aadhar Number',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Common.attachDocWidget(
                                          _registrationController
                                              .aadharCard.value, () async {
                                        _registrationController
                                                .pickedAadharCard =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: [
                                            'jpg',
                                            'pdf',
                                            'png',
                                            'jpeg'
                                          ],
                                        );
                                        if (_registrationController
                                                .pickedAadharCard !=
                                            null) {
                                          File file = File(
                                              _registrationController
                                                      .pickedAadharCard
                                                      ?.files
                                                      .single
                                                      .path ??
                                                  '');
                                          setState(() {
                                            _registrationController
                                                    .aadharCard.value =
                                                file.path.split('/').last;
                                          });
                                        } else {
                                          // User canceled the picker
                                        }
                                      }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController.panNoController,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'Pan Card No.',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Common.attachDocWidget(
                                          _registrationController.panCard.value,
                                          () async {
                                        _registrationController.pickedPanCard =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: [
                                            'jpg',
                                            'pdf',
                                            'png',
                                            'jpeg'
                                          ],
                                        );
                                        if (_registrationController
                                                .pickedPanCard !=
                                            null) {
                                          File file = File(
                                              _registrationController
                                                      .pickedPanCard
                                                      ?.files
                                                      .single
                                                      .path ??
                                                  '');
                                          setState(() {
                                            _registrationController
                                                    .panCard.value =
                                                file.path.split('/').last;
                                          });
                                        } else {
                                          // User canceled the picker
                                        }
                                      }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Radio(
                                              value: 1,
                                              groupValue: _radioSelected,
                                              activeColor:
                                                  ColorsConfig.colorBlue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _radioSelected = value as int;
                                                });
                                              },
                                            ),
                                          ),
                                          const Text('Driving Licence'),
                                          Expanded(
                                            child: Radio(
                                              value: 2,
                                              groupValue: _radioSelected,
                                              activeColor:
                                                  ColorsConfig.colorBlue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _radioSelected = value as int;
                                                });
                                              },
                                            ),
                                          ),
                                          const Text('Voter ID card'),
                                          Expanded(
                                            child: Radio(
                                              value: 3,
                                              groupValue: _radioSelected,
                                              activeColor:
                                                  ColorsConfig.colorBlue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _radioSelected = value as int;
                                                });
                                              },
                                            ),
                                          ),
                                          const Text('Passport'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        _registrationController.docNoController,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'Enter Document No.',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Common.attachDocWidget(
                                          _registrationController
                                              .optionalCard.value, () async {
                                        _registrationController
                                                .pickedOptionalCard =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: [
                                            'jpg',
                                            'pdf',
                                            'png',
                                            'jpeg'
                                          ],
                                        );
                                        if (_registrationController
                                                .pickedOptionalCard !=
                                            null) {
                                          File file = File(
                                              _registrationController
                                                      .pickedOptionalCard
                                                      ?.files
                                                      .single
                                                      .path ??
                                                  '');
                                          setState(() {
                                            _registrationController
                                                    .optionalCard.value =
                                                file.path.split('/').last;
                                          });
                                        } else {
                                          // User canceled the picker
                                        }
                                      }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      loginButtonWidget(
                                        'Next',
                                        () {
                                          forward();
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: Get.height,
                                color: ColorsConfig.colorWhite,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: ColorsConfig.colorBlue,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(
                                          color: ColorsConfig.colorBlue,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Text(
                                        'Vendor Agreement',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 22.0,
                                          color: ColorsConfig.colorWhite,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 15),
                                      decoration: BoxDecoration(
                                        color: ColorsConfig.colorWhite,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(
                                          color: ColorsConfig.colorBlue,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Text(
                                        'Complete your registration with Myndro by signingthis vendor agreement.(Please read the agreement carefully, provinecessary details and attach your digital signature.)',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 14.0,
                                          color: ColorsConfig.colorGreyy,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Signature',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 18.0,
                                          color: ColorsConfig.colorGreyy,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: ColorsConfig.colorGreyy,
                                                width: 1.0),
                                            borderRadius: const BorderRadius
                                                    .all(
                                                Radius.circular(
                                                    25.0)), // Set rounded corner radius
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'Upload Signature',
                                                style: TextStyle(
                                                    color:
                                                        ColorsConfig.colorGreyy,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.attach_file,
                                                color: ColorsConfig.colorGreyy,
                                                size: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: ColorsConfig.colorGreyy,
                                                width: 1.0),
                                            borderRadius: const BorderRadius
                                                    .all(
                                                Radius.circular(
                                                    25.0)), // Set rounded corner radius
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 14),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'Download Agreement',
                                                style: TextStyle(
                                                    color:
                                                        ColorsConfig.colorGreyy,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: InkWell(
                                        onTap: () {
                                          // Get.toNamed(CongAdminApproval.pageId);
                                          showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (_) => AnimatedDialog(
                                              outputText: 'Congratulations',
                                              subText:
                                                  'Your Profile is Successfully Completed.',
                                              titleSubtext:
                                                  'Please Wait For Admin Approval.',
                                              onClose: () {
                                                Get.toNamed(ExpertHome.pageId);
                                              },
                                            ),
                                          );
                                        },
                                        child: loginButtonWidget(
                                          'Submit',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //     bottom: 0,
                //     child: Image.asset(
                //       ImagePath.designBottom1,
                //       width: Get.width * 0.95,
                //       height: Get.height * 0.18,
                //       fit: BoxFit.fill,
                //     ))
              ],
            ),
          ),
        ));
  }
}

class StepProgressView extends StatelessWidget {
  const StepProgressView(
      List<String> stepsText,
      int curStep,
      double height,
      double width,
      double dotRadius,
      Color activeColor,
      Color inactiveColor,
      TextStyle headerStyle,
      TextStyle stepsStyle,
      {Key? key,
      this.decoration,
      this.padding,
      this.lineHeight = 2.0,
      required this.onTap})
      : _stepsText = stepsText,
        _curStep = curStep,
        _height = height,
        _width = width,
        _dotRadius = dotRadius,
        _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _headerStyle = headerStyle,
        _stepStyle = stepsStyle,
        assert(curStep > 0 == true && curStep <= stepsText.length),
        assert(width > 0),
        assert(height >= 2 * dotRadius),
        assert(width >= dotRadius * 2 * stepsText.length),
        super(key: key);

  //height of the container
  final double _height;

  //width of the container
  final double _width;

  //container decoration
  final BoxDecoration? decoration;

  //list of texts to be shown for each step
  final List<String> _stepsText;

  //cur step identifier
  final int _curStep;

  //active color
  final Color _activeColor;

  //in-active color
  final Color _inactiveColor;

  //dot radius
  final double _dotRadius;

  //container padding
  final EdgeInsets? padding;

  //line height
  final double lineHeight;

  //header textstyle
  final TextStyle _headerStyle;

  //steps text
  final TextStyle _stepStyle;
  final VoidCallback onTap;

  List<Widget> _buildDots() {
    var wids = <Widget>[];
    _stepsText.asMap().forEach((i, text) {
      var circleColor =
          (i == 0 || _curStep > i) ? _activeColor : _inactiveColor;

      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;

      wids.add(GestureDetector(
        onTap: () {
          onTap;
        },
        child: CircleAvatar(
          radius: _dotRadius,
          backgroundColor: circleColor,
        ),
      ));

      //add a line separator
      //0-------0--------0
      if (i != _stepsText.length - 1) {
        wids.add(
          Expanded(
            child: Container(
              height: lineHeight,
              color: lineColor,
            ),
          ),
        );
      }
    });

    return wids;
  }

  List<Widget> _buildText() {
    var wids = <Widget>[];
    _stepsText.asMap().forEach((i, text) {
      wids.add(Text(text, style: _stepStyle));
    });

    return wids;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: _height,
      width: _width,
      decoration: decoration,
      child: Column(
        children: <Widget>[
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: (_curStep).toString(),
                    style: _headerStyle.copyWith(
                      color: _activeColor, //this is always going to be active
                    ),
                  ),
                  TextSpan(
                    text: " / " + _stepsText.length.toString(),
                    style: _headerStyle.copyWith(
                      color: _curStep == _stepsText.length
                          ? _activeColor
                          : _inactiveColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: _buildDots(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildText(),
          )
        ],
      ),
    );
  }
}
