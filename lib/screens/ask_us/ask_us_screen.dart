import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../controller/controller.dart';

class AskUSScreen extends GetView<AskUsController> {
  static const pageId = "/AskUSScreen";

  const AskUSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutWidget(
        body: Column(
          children: [
            ChatListWidget(), //Chat list
            InputWidget()
          ],
        ),
        isAssessment: false,
        text: 'Ask Us',
      ),
    );
  }
}
