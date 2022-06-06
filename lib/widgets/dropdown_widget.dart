import 'package:flutter/material.dart';

import '../constant/constant.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({Key? key, this.dropdownValue, this.hintText, this.isExpanded})
      : super(key: key);
  late final String? dropdownValue;
  final String? hintText;
  final bool? isExpanded;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      iconDisabledColor: ColorsConfig.colorBlue,
      iconEnabledColor: ColorsConfig.colorBlue,
      isExpanded:widget.isExpanded! ,
      value: widget.dropdownValue,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
        hintText: widget.hintText!,
        labelText: widget.hintText!,
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(
            color: ColorsConfig.colorBlue,
            width: 1.5,
          ),
        ),
      ),
      items: <String>[
        'Lot 1',
        'Lot 2',
        'Lot 3',
        'Lot 4',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style:  TextStyle(
            fontFamily: AppTextStyle.microsoftJhengHei,
            fontSize: 13.0,
            color: ColorsConfig.colorBlue,
          ),),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.dropdownValue = newValue;
        });
      },
    );
  }
}
