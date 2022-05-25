import 'package:flutter/material.dart';

import '../constant/constant.dart';

Widget profileTextFieldWidget(
    TextEditingController controller,
    FormFieldValidator<String> validator,
    TextInputType inputType,
    String hintTxt,
    ){
  return TextFormField(
    style: TextStyle(
      fontFamily: AppTextStyle.microsoftJhengHei,
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: ColorsConfig.colorBlue,
    ),
    controller: controller,
    validator: validator,
    keyboardType: inputType,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 10),
      hintText: hintTxt,
      labelText: hintTxt,
      hintStyle:  TextStyle(
        fontFamily: AppTextStyle.microsoftJhengHei,
        fontSize: 13.0,
        color: ColorsConfig.colorBlue,
      ),
      filled: true,
      fillColor: ColorsConfig.colorLightBlue,
      focusedBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorsConfig.colorBlue, width: 1.5,),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: ColorsConfig.colorBlue,
          width: 1.5,
        ),
      ),
    ),
  );
}