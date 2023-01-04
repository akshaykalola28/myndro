import 'dart:convert';

import 'package:get/get.dart';
import 'package:myndro/screens/dashboard/dashboard.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class ExpertDetailController extends BaseController {
  @override
  void errorHandler(e) {}
  final DashboardController dashboardController = Get.find();
  String? dropdownValue;
  List listType = ['abc', 'def', 'ghi'];
  List<DrSlots> allDrSlots = <DrSlots>[].obs;
  RxString expertSlot = ''.obs;
  RxString expertSlotId = ''.obs;
  RxString audioVideoString = ''.obs;
  void setSelected(String value) {
    dropdownValue = value;
    update();
  }

  void getDrSlotList(int doctorId, String fromDate) async {
    bool status = await Common.checkInternetConnection();
    if (status) {
      var response = await RemoteServices.getDrSlots(doctorId, fromDate);
      var jsonData = json.decode(response.body);
      var data = jsonData["Slots"] as List;
      if (response.statusCode == 200) {
        allDrSlots.clear();
        for (dynamic i in data) {
          allDrSlots.add(DrSlots.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

////TODO application of promo is remaininig
  void createAppoitment(String audioVideo, String appoDate, String appoTime,
      String docCat, String docSubCat, String doctorId) async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.createAppointment(
          int.parse(jsonDecode(res)['PatientData']['patient_id']),
          jsonDecode(res)['PatientData']['patient_email'],
          audioVideo,
          appoDate,
          appoTime,
          docCat,
          docSubCat,
          doctorId,
          'WINTER20');
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200 && jsonData['type'] != 'error') {
        Common.displayMessage(jsonData["msg"] as String);
        dashboardController.onInit();
        Get.offNamed(DashboardScreen.pageId);
        dashboardController.changeTabIndex(0);
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
