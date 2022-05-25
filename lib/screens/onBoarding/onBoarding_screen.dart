import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  static const pageId = "/OnBoardingScreen";

  OnBoardingScreen({Key? key}) : super(key: key);
  final _controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(

      children: [
        Expanded(
          child: PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.onPageIndex,
              itemCount: _controller.onBoardingPages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _controller.onBoardingPages[index].imageAsset,
                      height: Get.height * 0.5,
                      width: Get.width,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 48),
                    Text(_controller.onBoardingPages[index].name),
                    const SizedBox(height: 120),

                  ],
                );
              }),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      _controller.onBoardingPages.length,
                          (index) => Obx(() {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color:
                              _controller.onPageIndex.value == index
                                  ? ColorsConfig.colorBlue
                                  : ColorsConfig.colorGreen,
                              borderRadius: BorderRadius.circular(10)),
                        );
                      })),
                ),
                GestureDetector(
                  onTap: _controller.forward,
                  child:  Obx(() {
                    return   loginButtonWidget(_controller.isLastPage ? 'Go' : 'Next');
                  })),
              ],
            ),
          ),
        )
      ],
    )));
  }
}
