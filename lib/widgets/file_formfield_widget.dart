import 'package:flutter/material.dart';

import '../constant/constant.dart';

class FileFormfieldWidget extends StatelessWidget {
  const FileFormfieldWidget(
      {Key? key,
      // required this.widgetBody,
      required this.validator,
      this.controller,
      required this.hintTxt,
      this.suffixIcon,
      this.onTap})
      : super(key: key);
  // final Widget widgetBody;
  final FormFieldValidator<String> validator;
  final TextEditingController? controller;
  final String hintTxt;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      cursorHeight: 0,
      cursorWidth: 0,
      style: TextStyle(
        fontFamily: AppTextStyle.microsoftJhengHei,
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        color: ColorsConfig.colorBlue,
      ),
      obscureText: false,
      controller: controller,
      validator: validator,
      // keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
        hintText: hintTxt,
        // labelText: hintTxt,
        hintStyle: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 15.0,
          color: ColorsConfig.colorBlue,
        ),
        suffixIcon: Icon(
          suffixIcon,
          size: 24,
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
    ); /* FormField(
        validator: validator,
        builder: (formFieldState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widgetBody,
              /* Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                      border: Border.all(
                                                          color: ColorsConfig
                                                              .colorBlue,
                                                          width: 1.5),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          _registrationController
                                                              .formattedDob
                                                              .value,
                                                          style: TextStyle(
                                                            fontFamily: AppTextStyle
                                                                .microsoftJhengHei,
                                                            fontSize: 15.0,
                                                            color: ColorsConfig
                                                                .colorBlue,
                                                          ),
                                                        ),
                                                        const Icon(
                                                          Icons.calendar_month,
                                                          color: ColorsConfig
                                                              .colorBlue,
                                                        )
                                                      ],
                                                    ),
                                                  ), */
              if (formFieldState.hasError)
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 12),
                  child: Text(
                    formFieldState.errorText!,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 13,
                        color: Colors.red[700],
                        height: 0.5),
                  ),
                )
            ],
          );
        }); */
  }
}
