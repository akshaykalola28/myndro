import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class ExpertCalenderController extends BaseController {
  @override
  void errorHandler(e) {}
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  RxString formattedToDate = 'To'.obs;
  RxString formattedFromDate = 'From'.obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  Future<void> selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: fromDate.value,
        firstDate: fromDate.value,
        lastDate: DateTime(2101));
    if (picked != null && picked != fromDate.value) {
      fromDate.value = picked;
      formattedFromDate.value = DateFormat('dd-MM-yyyy').format(fromDate.value);
    }
  }

  Future<void> selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: toDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != toDate.value) {
      toDate.value = picked;
      formattedToDate.value = DateFormat('dd-MM-yyyy').format(toDate.value);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: selectedTime.value,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickedS != null && pickedS != selectedTime.value) {
      selectedTime.value = pickedS;
    }
  }

  void createDrSlots() async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.saveDrSlots(
          18, formattedFromDate.value, formattedToDate.value, "09:36", "10:36");
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200 && jsonData['type'] != 'error') {
        Common.displayMessage(jsonData["msg"] as String);
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
