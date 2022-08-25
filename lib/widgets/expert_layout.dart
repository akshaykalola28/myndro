import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import 'widgets.dart';

class ExpertLayout extends StatelessWidget {
  const ExpertLayout({
    Key? key,
    this.text,
    required this.body,
    this.onDrawerClick
  }) : super(key: key);
  final Widget body;
  final String? text;
  final VoidCallback? onDrawerClick;

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
          ExpertAppbar(
            text: text!,
            onDrawerClick:onDrawerClick ,
          ),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    Get.focusScope!.unfocus();
                  },
                  child: body))
        ],
      ),
    );
  }
}
