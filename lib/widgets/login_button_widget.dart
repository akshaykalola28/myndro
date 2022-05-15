import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constant/constant.dart';

Widget loginButtonWidget(
    String buttonTxt,
    ){
  return Container(
    height: Get.height*0.083,
    width: Get.width,
    decoration: const BoxDecoration(
      color: ColorsConfig.colorBlue,
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
        boxShadow: [BoxShadow(
          color:Color.fromRGBO(0, 0, 0, 0.15),
          offset: Offset(4, 15),
          blurRadius: 15,
        ),]
    ),

    child: Center(
      child: Text(
          buttonTxt,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: AppTextStyle.poppinsMedium,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          color: ColorsConfig.colorWhite,
        ),
      ),
    ),
  );
}