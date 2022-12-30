import 'dart:convert';

import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class ExpertAppoController extends BaseController {
  @override
  void errorHandler(e) {}
  @override
  void onInit() async {
    super.onInit();
    getPatientsList();
  }

  List<Appointment> patientsList = <Appointment>[].obs;
  RxBool isLoading = false.obs;
  void getPatientsList() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getExpertAppointmentList(
          jsonDecode(res)['data']['doctor_id']);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['appointment'] as List;
      if (response.statusCode == 200) {
        patientsList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          patientsList.add(Appointment.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }
}
