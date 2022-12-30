import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class AskUsController extends BaseController {
  final TextEditingController sendMsgController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  @override
  void errorHandler(e) {}
  RxBool isLoading = false.obs;
  dynamic getData;
  List<GetExpertMsg> patientMsgs = <GetExpertMsg>[].obs;
  @override
  void onInit() async {
    super.onInit();
    getData = Get.arguments;
    getPatientMsgList('54', '135');

    // getPatientMsgList(getData['doctorId'], getData['appointmentId']);
  }

  void getPatientMsgList(String doctorId, String appointmentId) async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getPatientMsg(
          doctorId /*   jsonDecode(res)['PatientData']['patient_id'] */,
          '90',
          appointmentId);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        patientMsgs.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          patientMsgs.add(GetExpertMsg.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  ///TODO
  void sendPatientMsg() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.sendPatientMsg(
          '54', '90', '135', sendMsgController.text);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        getPatientMsgList('54', '135');
        sendMsgController.clear();
        Get.focusScope!.unfocus();
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }
}
