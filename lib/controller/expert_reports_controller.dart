import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../services/services.dart';
import '../util/common.dart';

class ExpertReportsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  RxString formattedToDate = 'To'.obs;
  RxString formattedFromDate = 'From'.obs;

  void errorHandler(e) {}
  String? sortValue;
  RxBool isLoading = false.obs;
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

  void expertToPatientReport() async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.expertToPatientReport));
      request.fields.addAll({
        'doctor_id': '18',
        'case_no': '',
        'from_date': '2022-12-02',
        'to_date': '2022-12-02'
      });

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        print('jsonData $jsonData');

        Common.displayMessage(jsonData["msg"] as String);
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
