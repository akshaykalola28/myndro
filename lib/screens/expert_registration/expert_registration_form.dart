import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../constant/constant.dart';
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

  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];
  String? dropdownValue;
  int? showIndex = 1;

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
            onTap: () {
              Get.focusScope!.unfocus();
            },
            child: Stack(
              children: [
                Positioned(
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
                // Positioned(
                //   top: 0,
                //   child: ClipPath(
                //     clipper: CurvedBottomClipper(),
                //     child: Container(
                //       // padding: const EdgeInsets.symmetric(horizontal: 15),
                //       color: ColorsConfig.colorBlue,
                //       height: Get.height * 0.20,
                //       width: Get.width,
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 50),
                //         child: Align(
                //           alignment: Alignment.centerRight,
                //           child: Text(
                //               "Registration Form For Counsellors , Therapist & Psychologist ",
                //               style: TextStyle(
                //                 fontFamily: AppTextStyle.microsoftJhengHei,
                //                 fontSize: 25.0,
                //                 fontWeight: FontWeight.w500,
                //                 color: ColorsConfig.colorWhite,
                //               )),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Positioned.fill(
                  top: 200,
                  child: SizedBox(
                    height: Get.height,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 80.0, child: _getStepProgress()),
                        Expanded(
                          child: PageView(
                            onPageChanged: (i) {
                              setState(() {
                                _curPage = i + 1;
                              });
                            },
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
                                        Common.validatePassword,
                                        TextInputType.phone,
                                        'Contact',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        passController,
                                        Common.validateEmail,
                                        TextInputType.text,
                                        'Email',
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
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: loginButtonWidget('Next'),
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
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    DropDownWidget(
                                      dropdownValue: dropdownValue,
                                      hintText: 'Profession',
                                      isExpanded: true,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    attachDocWidget('Degree Certificate'),
                                    // DropDownWidget(
                                    //   dropdownValue: dropdownValue,
                                    //   hintText: 'Degree Certificate',
                                    //   isExpanded: true,
                                    // ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    attachDocWidget('Practice Certificate'),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: loginButtonWidget(
                                        'Next',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
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
                                      DropDownWidget(
                                        dropdownValue: dropdownValue,
                                        hintText: 'Bank Name',
                                        isExpanded: true,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        passController,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'Account Holder Name',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        passController,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'Account Number',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DropDownWidget(
                                        dropdownValue: dropdownValue,
                                        hintText: 'Account Type',
                                        isExpanded: true,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        passController,
                                        Common.validatePassword,
                                        TextInputType.text,
                                        'IFSC Code',
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
                                      attachDocWidget(
                                          'Attach Your Cancel Cheque'),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: loginButtonWidget(
                                          'Next',
                                        ),
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

                                          showIndex = index;

                                          print('showIndex to: $showIndex');
                                          setState(() {});
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      showIndex == 1
                                          ? Container(
                                        height: 75,
                                              width: Get.width,
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'upload Your copy of GST Registration\nCertificate ',
                                                    style: TextStyle(
                                                      fontFamily: AppTextStyle
                                                          .microsoftJhengHei,
                                                      fontSize: 17.0,
                                                      color: ColorsConfig
                                                          .colorBlue,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.attach_file,
                                                    size: 35,
                                                    color:
                                                        ColorsConfig.colorWhite,
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(
                                        // height: 75,
                                              width: Get.width,
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'Fill the necessary details and attach\n your digital signature in below\n attached self-declaration. ',
                                                    style: TextStyle(
                                                      fontFamily: AppTextStyle
                                                          .microsoftJhengHei,
                                                      fontSize: 17.0,
                                                      color: ColorsConfig
                                                          .colorBlue,
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                  const Icon(
                                                    Icons.attach_file,
                                                    size: 35,
                                                    color:
                                                        ColorsConfig.colorWhite,
                                                  ),
                                                ],
                                              ),
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: loginButtonWidget(
                                          'Next',
                                        ),
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
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    attachDocWidget('Aadhar Card'),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    attachDocWidget('Pan Card'),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    attachDocWidget(
                                        'Driving/ Voter Id / Passport'),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: loginButtonWidget(
                                        'Next',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
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
                                          color: ColorsConfig.colorBlue,
                                        ),
                                      ),
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

Widget attachDocWidget(String text) {
  return Container(
    height: 50,
    width: Get.width,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: ColorsConfig.colorWhite,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(0),
      border: Border.all(
        color: ColorsConfig.colorBlue,
        width: 1.5,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: AppTextStyle.microsoftJhengHei,
            fontSize: 16.0,
            color: ColorsConfig.colorBlue,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.attach_file,
          size: 25,
          color: ColorsConfig.colorBlue,
        ),
      ],
    ),
  );
}
