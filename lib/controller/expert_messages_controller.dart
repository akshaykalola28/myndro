import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class ExpertMessagesController extends BaseController {
  final TextEditingController sendMsgController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  @override
  void errorHandler(e) {}
  dynamic getData;
  @override
  void onInit() async {
    super.onInit();
    getData = Get.arguments;
    getExpertMsgList('90', '135');

    // getExpertMsgList(getData['patientId'], getData['appointmentId']);
    // getPatientMsgList(getData['patientId'], getData['appointmentId']);
  }

  List<GetExpertMsg> expertMsgs = <GetExpertMsg>[].obs;

  RxBool isLoading = false.obs;

  void getExpertMsgList(String patientId, String appointmentId) async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getExpertMsg(
          '54' /*   jsonDecode(res)['data']['doctor_id'] */,
          patientId,
          appointmentId);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        expertMsgs.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          expertMsgs.add(GetExpertMsg.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  ///TODO
  void sendExpertMsg() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.sendExpertMsg(
          '54', '90', '135', sendMsgController.text);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        getExpertMsgList('90', '135');
        sendMsgController.clear();
        Get.focusScope!.unfocus();
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }
}
