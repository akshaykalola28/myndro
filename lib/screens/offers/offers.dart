import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

import '../../widgets/widgets.dart';

class OffersScreen extends GetView<OffersController> {
  static const pageId = "/OffersScreen";

  OffersScreen({Key? key}) : super(key: key);
  var list = [CouponWidget(), CouponWidgetNew()];
  final _random = Random();
  // var element = list[_random.nextInt(list.length)];
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      body: Padding(
          padding: const EdgeInsets.all(14),
          child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemBuilder: (context, index) {
                return list[_random.nextInt(list
                    .length)] /* (list.toList()..shuffle()).any((element) => element) */;
              })),
      isAssessment: false,
      text: 'Offers',
    );
  }
}
