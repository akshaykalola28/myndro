import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

Widget socialButtonWidget(
    String imageLogo,
    String imageText,
    ){
  return Expanded(
    child: InkWell(
      child: Container(
        height: Get.height*0.083,
        width: Get.width/2.3,
        decoration:  BoxDecoration(
            color: ColorsConfig.colorWhite,
            border: Border.all(color: ColorsConfig.colorBlue),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16,),
            Image.asset(imageLogo,height: Get.height*0.04,width: 20,),
            const SizedBox(width: 12,),
            Center(child: Image.asset(imageText,height: Get.height*0.038,width: Get.width*0.22,)),
            const SizedBox(width: 10,),
          ],
        )
      ),
    ),
  );
}