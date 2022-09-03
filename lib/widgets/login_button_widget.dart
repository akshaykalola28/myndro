import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

Widget loginButtonWidget(
    String buttonTxt,
    [VoidCallback? onClick]) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 11),
      width: Get.width,
      decoration: const BoxDecoration(
        color: ColorsConfig.colorBlue,
        // borderRadius: BorderRadius.all(
        //   Radius.circular(8),
        // ),
        // boxShadow: [BoxShadow(
        //   color:Color.fromRGBO(0, 0, 0, 0.15),
        //   offset: Offset(4, 15),
        //   blurRadius: 15,
        // ),]
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