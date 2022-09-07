import 'package:flutter/material.dart';

import '../constant/constant.dart';

class DropDownWidget<T> extends StatelessWidget {
   DropDownWidget({Key? key,  this.hintText, this.isExpanded, required this.texts, required this.items, this.onChanged, this.validator})
      : super(key: key);
   final List<String> texts;
   final List<T> items;
   final ValueChanged<T?>? onChanged;
   final String? hintText;
   final FormFieldValidator<T>? validator;
  final bool? isExpanded;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      iconDisabledColor: ColorsConfig.colorBlue,
      iconEnabledColor: ColorsConfig.colorBlue,
      isExpanded: isExpanded!,
      validator: validator,
      // value: widget.dropdownValue,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
        hintText: hintText!,
        labelText: hintText!,
        hintStyle: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 15.0,
          color: ColorsConfig.colorBlue,
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(
            color: ColorsConfig.colorBlue,
            width: 1.5,
          ),
        ),
      ),
      items:texts
          .map((e) => DropdownMenuItem<T>(
        value: items[texts.indexOf(e)],
        child: Text(
          e,
          style: TextStyle(
            fontFamily: AppTextStyle.microsoftJhengHei,
            fontSize: 15.0,
            color: ColorsConfig.colorBlue,
          ),
        ),
      ))
          .toList(),
     /* texts.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style:  TextStyle(
            fontFamily: AppTextStyle.microsoftJhengHei,
            fontSize: 13.0,
            color: ColorsConfig.colorBlue,
          ),),
        );
      }).toList(),*/
      onChanged: onChanged,
    );
  }
}
