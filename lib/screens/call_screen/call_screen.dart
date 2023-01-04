import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';

class CallScreen extends GetView<CallScreenController> {
  static const pageId = "/CallScreen";

  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
          onWillPop: () => controller.exitApp(context),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                  onPressed: () => controller.exitApp(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ColorsConfig.colorWhite,
                    size: 30,
                  )),
              backgroundColor: ColorsConfig.colorBlue,
            ),
            body: Stack(
              children: [
                WebViewWidget(
                  controller: controller.webController,
                ),
                if (controller.loadingPercentage.value < 100)
                  LinearProgressIndicator(
                    value: controller.loadingPercentage.value / 100.0,
                  ),
              ],
            ),
          ),
        ));
  }
}
