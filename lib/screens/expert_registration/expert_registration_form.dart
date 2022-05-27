import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../constant/constant.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class ExpertRegistrationForm extends StatefulWidget {
  static const pageId = "/ExpertRegistrationScreen";

  const ExpertRegistrationForm({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ExpertRegistrationFormState createState() => _ExpertRegistrationFormState();
}

class _ExpertRegistrationFormState extends State<ExpertRegistrationForm> {
  final _stepsText = ['Profile', 'Degree', 'Bank', 'GST', 'KYC'];

  final _stepCircleRadius = 10.0;

  final _stepProgressViewHeight = 100.0;

  final Color _activeColor = ColorsConfig.colorBlue;

  final Color _inactiveColor = Colors.grey;

  final TextStyle _headerStyle =
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  final TextStyle _stepStyle =
      const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);

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
        left: 24.0,
        right: 24.0,
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
                      // padding: const EdgeInsets.symmetric(horizontal: 15),
                      color: ColorsConfig.colorBlue,
                      height: Get.height * 0.20,
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              "Registration Form For Counsellors , Therapist & Psychologist ",
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsConfig.colorWhite,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 175,
                  child: SizedBox(
                    height: Get.height * 0.45,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            flex: 0,
                            child: SizedBox(
                                height: 80.0, child: _getStepProgress())),
                        SizedBox(
                          height: Get.height * 0.43,
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.45,
                                            child: profileTextFieldWidget(
                                              passController,
                                              Common.validatePassword,
                                              TextInputType.text,
                                              'First Name',
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.45,
                                            child: profileTextFieldWidget(
                                              passController,
                                              Common.validatePassword,
                                              TextInputType.text,
                                              'Last Name',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.45,
                                            child: profileTextFieldWidget(
                                              passController,
                                              Common.validatePassword,
                                              TextInputType.phone,
                                              'Contact',
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.45,
                                            child: profileTextFieldWidget(
                                              passController,
                                              Common.validateEmail,
                                              TextInputType.text,
                                              'Email',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.45,
                                            child: profileTextFieldWidget(
                                              passController,
                                              Common.validatePassword,
                                              TextInputType.phone,
                                              'Contact',
                                            ),
                                          ),
                                          SizedBox(
                                              width: Get.width * 0.45,
                                              child: DropDownWidget(
                                                dropdownValue: dropdownValue,
                                                hintText: 'Gender',
                                                isExpanded: false,
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        passController,
                                        Common.validatePassword,
                                        TextInputType.multiline,
                                        'Street Address',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        passController,
                                        Common.validatePassword,
                                        TextInputType.multiline,
                                        'Street Address Line 2',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                              width: Get.width * 0.45,
                                              child: DropDownWidget(
                                                dropdownValue: dropdownValue,
                                                hintText: 'City',
                                                isExpanded: false,
                                              )),
                                          SizedBox(
                                              width: Get.width * 0.45,
                                              child: DropDownWidget(
                                                dropdownValue: dropdownValue,
                                                hintText: 'Postal/Zip Code',
                                                isExpanded: false,
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                              width: Get.width * 0.45,
                                              child: DropDownWidget(
                                                dropdownValue: dropdownValue,
                                                hintText: 'State',
                                                isExpanded: false,
                                              )),
                                          SizedBox(
                                              width: Get.width * 0.45,
                                              child: DropDownWidget(
                                                dropdownValue: dropdownValue,
                                                hintText: 'Country',
                                                isExpanded: false,
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: loginButtonWidget('Submit'),
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
                                    attachDocWidget('Practice'),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: loginButtonWidget('Submit'),
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
                                        'Street Address',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      profileTextFieldWidget(
                                        passController,
                                        Common.validatePassword,
                                        TextInputType.multiline,
                                        'Street Address Line 2',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                              width: Get.width * 0.45,
                                              child: DropDownWidget(
                                                dropdownValue: dropdownValue,
                                                hintText: 'City',
                                                isExpanded: false,
                                              )),
                                          SizedBox(
                                              width: Get.width * 0.45,
                                              child: DropDownWidget(
                                                dropdownValue: dropdownValue,
                                                hintText: 'Postal/Zip Code',
                                                isExpanded: false,
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                              width: Get.width * 0.45,
                                              child: DropDownWidget(
                                                dropdownValue: dropdownValue,
                                                hintText: 'State',
                                                isExpanded: false,
                                              )),
                                          SizedBox(
                                              width: Get.width * 0.45,
                                              child: DropDownWidget(
                                                dropdownValue: dropdownValue,
                                                hintText: 'Country',
                                                isExpanded: false,
                                              )),
                                        ],
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
                                        child: loginButtonWidget('Submit'),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: ColorsConfig.colorBlue,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Are you register under GST?',
                                          style: TextStyle(
                                            fontFamily:
                                                AppTextStyle.microsoftJhengHei,
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
                                      minWidth: 72.0,
                                      minHeight: 38,
                                      cornerRadius: 20.0,
                                      activeBgColors: const [
                                        [ColorsConfig.colorBlue],
                                        [ColorsConfig.colorBlue]
                                      ],
                                      activeFgColor: Colors.black,
                                      inactiveBgColor:
                                          ColorsConfig.colorLightBlue,
                                      inactiveFgColor: Colors.black,
                                      initialLabelIndex: 1,
                                      totalSwitches: 2,
                                      labels: const ['No', 'yes'],
                                      radiusStyle: true,
                                      onToggle: (index) {},
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
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
                                            'upload Your copy of GST Registration \nCertificate ',
                                            style: TextStyle(
                                              fontFamily: AppTextStyle
                                                  .microsoftJhengHei,
                                              fontSize: 16.0,
                                              color: ColorsConfig.colorWhite,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.attach_file,
                                            size: 35,
                                            color: ColorsConfig.colorWhite,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: loginButtonWidget('Submit'),
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
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
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
                                            'upload Your copy of GST Registration \nCertificate ',
                                            style: TextStyle(
                                              fontFamily: AppTextStyle
                                                  .microsoftJhengHei,
                                              fontSize: 16.0,
                                              color: ColorsConfig.colorWhite,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.attach_file,
                                            size: 35,
                                            color: ColorsConfig.colorWhite,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: loginButtonWidget('Submit'),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Image.asset(
                      ImagePath.designBottom1,
                      width: Get.width * 0.95,
                      height: Get.height * 0.18,
                      fit: BoxFit.fill,
                    ))
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
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

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
      color: ColorsConfig.colorLightBlue,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(12),
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
