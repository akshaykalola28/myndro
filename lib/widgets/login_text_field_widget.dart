import 'package:flutter/material.dart';

import '../constant/constant.dart';

Widget loginTextFieldWidget(
    TextEditingController controller,
    bool isPassword,
    FormFieldValidator<String> validator,
    TextInputType inputType,
    String hintTxt,
){
  return TextFormField(
    style: TextStyle(
      fontFamily: AppTextStyle.poppinsMedium,
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: ColorsConfig.colorHintText,
    ),
    controller: controller,
    obscureText: isPassword,
    validator: validator,
    keyboardType: inputType,
    decoration: InputDecoration(
      //contentPadding: EdgeInsets.only(left: 20,top: 20,bottom: 20),
      hintText: hintTxt,
      hintStyle:  TextStyle(
        fontFamily: AppTextStyle.poppinsMedium,
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        color: ColorsConfig.colorHintText,
      ),
      filled: true,
      fillColor: ColorsConfig.colorWhite,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorsConfig.colorFocusedBorder),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: ColorsConfig.colorOutlineBorder,
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),
  );
}