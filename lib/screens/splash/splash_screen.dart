
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';

class SplashScreen extends GetView<SplashController> {
  static const pageId = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  SizedBox(
       height: double.infinity,
       width: double.infinity,
       child: Image.asset(ImagePath.splashScreen,
         fit: BoxFit.cover,
        ),
     );
  }


}