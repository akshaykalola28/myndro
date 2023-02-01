import 'package:flutter/material.dart';

import '../constant/constant.dart';

Widget loginTextFieldWidget(
    TextEditingController controller,
    bool isPassword,
    FormFieldValidator<String> validator,
    TextInputType inputType,
    String hintTxt,
    IconData prefixIcon,
    [IconData? suffixIcon]) {
  return TextFormField(
    style: TextStyle(
      fontFamily: AppTextStyle.microsoftJhengHei,
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: ColorsConfig.colorBlue,
    ),
    controller: controller,
    obscureText: isPassword,
    validator: validator,
    keyboardType: inputType,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      prefixIcon: Icon(prefixIcon, color: ColorsConfig.colorBlue, size: 23),
      suffixIcon: Icon(suffixIcon, color: ColorsConfig.colorBlue, size: 23),
      hintText: hintTxt,
      hintStyle: TextStyle(
        fontFamily: AppTextStyle.microsoftJhengHei,
        fontSize: 13.0,
        color: ColorsConfig.colorBlue,
      ),
      filled: true,
      fillColor: ColorsConfig.colorWhite,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(color: ColorsConfig.colorBlue),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(color: ColorsConfig.colorBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(color: ColorsConfig.colorBlue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: const BorderSide(
          color: ColorsConfig.colorBlue,
          width: 1.0,
        ),
      ),
    ),
  );
}
