import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class ExpertAppointmentController extends BaseController {
  @override
  void errorHandler(e) {}
  String? dropValue;
  List<Appointment> appoList = <Appointment>[].obs;
  RxBool isLoading = false.obs;
  void setSelected(String value) {
    dropValue = value;
    update();
  }

  TextEditingController searchController = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    getAppointmentList();
  }

  List sortType = ['Individual', 'Package', 'Audio Call', 'Video Call'];

  void getAppointmentList() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getExpertAppointmentList(
          jsonDecode(res)['data']['doctor_id']);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['appointment'] as List;
      if (response.statusCode == 200) {
        isLoading.value = false;
        for (dynamic i in data) {
          appoList.add(Appointment.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }
}
