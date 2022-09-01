import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class ExpertMessages extends GetView<ExpertMessagesController> {
  static const pageId = "/ExpertMessages";

  const ExpertMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExpertLayout(
      leadingIcon: Icons.arrow_back,
      onDrawerClick: () {
        Get.back();
      },
      text: 'Messages',
      body: Column(
        children: [
          ChatListWidget(), //Chat list
          InputWidget()
        ],
      ),
    ));
  }
}
