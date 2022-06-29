import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class WalletController extends GetxController
    with GetSingleTickerProviderStateMixin {
  void errorHandler(e) {}
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Monthly'),
    const Tab(text: 'Weekly'),
    const Tab(text: 'Today'),
  ];

  TabController? controller;

  @override
  void onInit() {
    super.onInit();
    controller =
        TabController(vsync: this, length: myTabs.length, initialIndex: 2);
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
