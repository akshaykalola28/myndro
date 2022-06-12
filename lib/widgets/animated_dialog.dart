import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/widgets/widgets.dart';

import '../constant/constant.dart';

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog(
      {Key? key,
      this.outputText,
      this.subText,
      this.titleSubtext,
      this.onClose})
      : super(key: key);
  final String? outputText;
  final String? subText;
  final String? titleSubtext;
  final VoidCallback? onClose;

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          child: ScaleTransition(
            scale: scaleAnimation!,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                        onPressed: widget.onClose,
                        icon: const Icon(
                          Icons.clear,
                          color: ColorsConfig.colorBlack,
                          size: 25,
                        ))),
                Container(
                  width: Get.width,
                  // height: Get.height*0.4,
                  height: 300,
                  // margin: const EdgeInsets.symmetric(
                  //   horizontal: 20,
                  // ),
                  // padding: const EdgeInsets.symmetric(
                  //   vertical: 30,
                  // ),
                  // decoration: ShapeDecoration(
                  //     // color: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckAnimation(),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.outputText!,
                        style: TextStyle(
                          fontFamily: AppTextStyle.madleyBold,
                          fontSize: 30.0,
                          color: ColorsConfig.colorBlue,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.subText!,
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 18.0,
                          color: ColorsConfig.colorBlue,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.titleSubtext!,
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 18.0,
                          color: ColorsConfig.colorBlue,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
