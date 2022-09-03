import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpertPatientInfoController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  RxString formattedToDate = 'To'.obs;
  RxString formattedFromDate = 'From'.obs;

  String? sortValue;

  void setSelectedSortValue(String value) {
    sortValue = value;
    update();
  }

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
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  List sortingList = ['abc', 'bbb', 'ccc', 'dddd'];

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
}
