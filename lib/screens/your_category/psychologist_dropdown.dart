import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../widgets/widgets.dart';

class PsycologistDropdown extends StatefulWidget {
  static const pageId = "/PsycologistDropdown";

  const PsycologistDropdown({Key? key}) : super(key: key);

  @override
  State<PsycologistDropdown> createState() => _PsycologistDropdownState();
}

class _PsycologistDropdownState extends State<PsycologistDropdown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: ClipPath(
              clipper: CurvedBottomClipper(),
              child: Container(
                color: ColorsConfig.colorBlue,
                height: Get.height * 0.26,
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
          //   right: 0,
          //   child: Image.asset(
          //     ImagePath.catTop,
          //     fit: BoxFit.fill,
          //     height: Get.height * 0.25,
          //     width: Get.width * 0.7,
          //   ),
          // ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.3,
                  ),
                  Theme(
                    data: ThemeData(
                      canvasColor: ColorsConfig.colorBlue,
                    ),
                    child: DropdownButtonFormField<String>(
                      iconDisabledColor: ColorsConfig.colorBlue,
                      iconEnabledColor: ColorsConfig.colorBlue,
                      isExpanded: true,
                      value: dropdownValue,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 10),
                        hintText: 'Psychologist',
                        hintStyle: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorWhite,
                        ),
                        filled: true,
                        fillColor: ColorsConfig.colorBlue,
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
                        'Clinical Psychologist',
                        'Psychotherapist',
                        'Therapist',
                        'Counsellor',
                        'Organizational Psychologist',
                        ' Neuropsychologist',
                        ' School Counsellor',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: ColorsConfig.colorWhite,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(ExpertRegistrationForm.pageId),
                      child: loginButtonWidget(
                        'Done',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: Image.asset(
          //     ImagePath.dropBottom,
          //     fit: BoxFit.fill,
          //     height: Get.height * 0.25,
          //     width: Get.width * 0.7,
          //   ),
          // )
        ],
      ),
    );
  }
}
