import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class CallScreenController extends BaseController {
  late final WebViewController webController;
  dynamic getMeetDetails;
  @override
  void errorHandler(e) {}
  var loadingPercentage = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    getMeetDetails = Get.arguments;
    startMeetByDr(getMeetDetails['meetDetail'].meetingId ?? '');
    webController = WebViewController();
  }

  Future<bool> exitApp(BuildContext context) async {
    if (await webController.canGoBack()) {
      print("onwill goback");
      webController.goBack();
      return Future.value(true);
    } else {
      Get.back();
      return Future.value(false);
    }
  }

  void startMeetByDr(String meetId) async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      var response = await RemoteServices.startMeetingByDr(meetId);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        Common.displayMessage(jsonData["msg"] as String);
        webController
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (url) {
                loadingPercentage.value = 0;
              },
              onProgress: (progress) {
                loadingPercentage.value = progress;
              },
              onPageFinished: (url) {
                loadingPercentage.value = 100;
              },
              onNavigationRequest: (navigation) {
                final host = Uri.parse(navigation.url).host;
                if (host.contains('youtube.com')) {
                  Common.displayMessage(
                    'Blocking navigation to $host',
                  );

                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..addJavaScriptChannel(
            'SnackBar',
            onMessageReceived: (message) {
              Common.displayMessage(message.message);
            },
          )
          ..loadRequest(Uri.parse(jsonData["url"]));
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
