import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';

class ExpertPatientInfoController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  RxString formattedToDate = 'To'.obs;
  RxString formattedFromDate = 'From'.obs;
  TextEditingController searchController = TextEditingController();
  String? sortValue;
  RxBool isLoading = false.obs;
  void setSelectedSortValue(String value) {
    sortValue = value;
    update();
  }

  List<Appointment> patientInfoList = <Appointment>[].obs;
  final List<Tab> myTabs = <Tab>[
    const Tab(text: "Today's Appointment"),
    const Tab(text: 'Upcoming Appointments'),
    const Tab(text: 'Past Appointments'),
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    getPatientList('');
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  List sortingList = ['Individual', 'Package', 'Audio Call', 'Video Call'];

  Future<void> selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: fromDate.value,
        firstDate: DateTime(2015, 8),
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

  void getPatientList(String sortType) async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      dynamic response;
      if (searchController.text.trim().isEmpty) {
        response = await RemoteServices.getExpertAppointmentList(
            jsonDecode(res)['data']['doctor_id'], sortType, '');
      } else {
        response = await RemoteServices.getExpertAppointmentList(
          jsonDecode(res)['data']['doctor_id'],
          sortType,
          searchController.text.trim(),
        );
      }
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['appointment'] as List;
      if (response.statusCode == 200) {
        patientInfoList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          patientInfoList.add(Appointment.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  void startMeetByDr(BuildContext context, String meetId) async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      var response = await RemoteServices.startMeetingByDr(meetId);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        Common.displayMessage(jsonData["msg"] as String);
        Common.launchCallURL(context, jsonData["url"]);
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
