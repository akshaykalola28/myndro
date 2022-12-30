import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../controller/controller.dart';

class AskUSScreen extends GetView<AskUsController> {
  static const pageId = "/AskUSScreen";

  const AskUSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutWidget(
        body: Obx(
          () => Column(
            children: [
              ChatListWidget(
                messages: controller.patientMsgs,
                loadingValue: controller.isLoading.value,
                scrollControl: controller.listScrollController,
              ), //Chat list
              InputWidget(
                msgController: controller.sendMsgController,
                onSend: () => controller.sendPatientMsg(),
              )
            ],
          ),
        ),
        isAssessment: false,
        text: 'Ask Us',
      ),
    );
  }
}
