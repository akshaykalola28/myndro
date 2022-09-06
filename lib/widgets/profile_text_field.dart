import 'package:flutter/material.dart';

import '../constant/constant.dart';

Widget profileTextFieldWidget(
    TextEditingController controller,
    FormFieldValidator<String>? validator,
    TextInputType inputType,
    String hintTxt,
    [VoidCallback? onSufficIcon,
    IconData? suffixIcon,
    ]) {
  return TextFormField(
    // autovalidateMode: AutovalidateMode.always,
    style: TextStyle(
      fontFamily: AppTextStyle.microsoftJhengHei,
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: ColorsConfig.colorBlue,
    ),
    // onChanged: (value) => onChanged!(value),
    controller: controller,
    validator: validator,
    keyboardType: inputType,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
      hintText: hintTxt,
      labelText: hintTxt,
      hintStyle: TextStyle(
        fontFamily: AppTextStyle.microsoftJhengHei,
        fontSize: 15.0,
        color: ColorsConfig.colorBlue,
      ),
      suffixIcon: IconButton(
        color: ColorsConfig.colorBlue,
        onPressed: onSufficIcon,
        icon: Icon(suffixIcon, size: 24),
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(
          color: ColorsConfig.colorBlue,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
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
  );
}
