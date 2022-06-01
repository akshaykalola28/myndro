import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';

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
            right: 0,
            child: Image.asset(
              ImagePath.catTop,
              fit: BoxFit.fill,
              height: Get.height * 0.25,
              width: Get.width * 0.7,
            ),
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.18,
                  ),
                  Theme(
                    data: new ThemeData(
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: ColorsConfig.colorBlue,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              ImagePath.dropBottom,
              fit: BoxFit.fill,
              height: Get.height * 0.25,
              width: Get.width * 0.7,
            ),
          )
        ],
      ),
    );
  }
}
