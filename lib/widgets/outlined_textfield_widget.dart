import 'package:flutter/material.dart';

import '../constant/constant.dart';

Widget outlinedTextField(
    TextEditingController controller,
    bool isPassword,
    FormFieldValidator<String> validator,
    TextInputType inputType,
    String hintTxt,
    int maxLines,
    {bool isPackageForm = false}) {
  return TextFormField(
    maxLines: maxLines,
    style: TextStyle(
      fontFamily: AppTextStyle.microsoftJhengHei,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: ColorsConfig.colorGreyy,
    ),
    controller: controller,
    obscureText: isPassword,
    validator: validator,
    keyboardType: inputType,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
      hintText: hintTxt,
      labelText: isPackageForm ? hintTxt : null,
      hintStyle: TextStyle(
        fontFamily: AppTextStyle.microsoftJhengHei,
        fontSize: 18.0,
        color: ColorsConfig.colorGreyy,
      ),
      filled: true,
      fillColor: ColorsConfig.colorWhite,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorsConfig.colorGreyy),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorsConfig.colorGreyy),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: ColorsConfig.colorGreyy,
          width: 1.0,
        ),
      ),
    ),
  );
}
