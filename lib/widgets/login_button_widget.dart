import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

Widget loginButtonWidget(
    String buttonTxt,
    [VoidCallback? onClick]) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      width: Get.width,
      decoration: const BoxDecoration(
        color: ColorsConfig.colorBlue,
      ),
      child: Center(
        child: Text(
          buttonTxt,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTextStyle.microsoftJhengHei,
            fontSize: 16.0,
            color: ColorsConfig.colorWhite,
          ),
        ),
      ),
    ),
  );
}