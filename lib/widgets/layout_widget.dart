import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import 'widgets.dart';

class LayoutWidget extends StatelessWidget {
  LayoutWidget(
      {Key? key,
      required this.body,
      this.text,
      this.isAssessment,
      this.isAssessBack})
      : super(key: key);

  final Widget body;
  final String? text;
  bool? isAssessment = false;
  final VoidCallback? isAssessBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Column(
        children: [
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              color: ColorsConfig.colorBlue,
              height: Get.height * 0.25,
              width: Get.width,
              child: SafeArea(
                child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: Get.height * 0.4,
                        width: Get.width * 0.4,
                        child: Image.asset(
                          ImagePath.myndroWhite,
                          fit: BoxFit.contain,
                        ))),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          UserAppbar(
              text: text!,
              isAssessment: isAssessment,
              isAssessBack: isAssessBack),
          Expanded(child: body)
        ],
      ),
    );
  }
}
