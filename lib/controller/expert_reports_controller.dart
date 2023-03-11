import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';

class ExpertReportsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  RxString formattedToDate = ''.obs;
  RxString formattedFromDate = ''.obs;
  List<Appointment> exToPatientList = <Appointment>[].obs;
  List<Appointment> myToExpertList = <Appointment>[].obs;
  TextEditingController searchController = TextEditingController();
  void errorHandler(e) {}
  String? sortValue;
  RxBool isLoading = false.obs;
  RxBool isMyndroToExLoading = false.obs;
  void setSelectedSortValue(String value) {
    sortValue = value;
    update();
  }

  List sortingList = ['abc', 'bbb', 'ccc', 'dddd'];
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Expert to Patient'),
    const Tab(text: 'Myndro to Expert'),
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    expertToPatientReport();
    myndroToExpertReport();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

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

  void expertToPatientReport() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.expertToPatientReport));
      if (searchController.text.trim().isNotEmpty) {
        request.fields.addAll({
          'doctor_id': jsonDecode(res)['data']['doctor_id'],
          'searchstring': searchController.text.trim()
        });
      } else if (formattedFromDate.value != '' && formattedToDate.value != '') {
        request.fields.addAll({
          'doctor_id': jsonDecode(res)['data']['doctor_id'],
          'from_date': formattedFromDate.value,
          'to_date': formattedToDate.value
        });
      } else {
        request.fields.addAll({
          'doctor_id': jsonDecode(res)['data']['doctor_id'],
        });
      }
      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      var jsonData = json.decode(respStr);
      var data = jsonData["data"] as List;

      if (response.statusCode == 200) {
        exToPatientList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          exToPatientList.add(Appointment.fromJson(i));
        }
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

//myndro to expert

  void myndroToExpertReport() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isMyndroToExLoading.value = true;
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.myndroToExpertReport));
      if (searchController.text.trim().isNotEmpty) {
        request.fields.addAll({
          'doctor_id': jsonDecode(res)['data']['doctor_id'],
          'searchstring': searchController.text.trim()
        });
      } else if (formattedFromDate.value != '' && formattedToDate.value != '') {
        request.fields.addAll({
          'doctor_id': jsonDecode(res)['data']['doctor_id'],
          'from_date': formattedFromDate.value,
          'to_date': formattedToDate.value
        });
      } else {
        request.fields.addAll({
          'doctor_id': jsonDecode(res)['data']['doctor_id'],
        });
      }
      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();

      var jsonData = json.decode(respStr);
      var data = jsonData["data"] as List;

      if (response.statusCode == 200) {
        myToExpertList.clear();
        isMyndroToExLoading.value = false;
        for (dynamic i in data) {
          myToExpertList.add(Appointment.fromJson(i));
        }
      } else {
        print(response.reasonPhrase);
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  showPopupMenu(BuildContext context, Offset offset) {
    double left = offset.dx;
    double top = offset.dy;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        const PopupMenuItem<String>(
          value: '1',
          child: Text('Download Single Invoice'),
        ),
        const PopupMenuItem<String>(
          value: '2',
          child: Text('Download All Invoice'),
        ),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
      } else if (itemSelected == "2") {
      } else {
        //code here
      }
    });
  }
}
