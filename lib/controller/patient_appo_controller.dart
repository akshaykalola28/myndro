import 'dart:convert';

import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class PatientAppoController extends BaseController {
  @override
  void errorHandler(e) {}
  @override
  void onInit() async {
    super.onInit();
    getPatientsList();
  }

  List<Appointment> expertsList = <Appointment>[].obs;
  RxBool isLoading = false.obs;

  void getPatientsList() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getPatientAppointmentList(
          jsonDecode(res)['PatientData']['patient_id']);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['appointment'] as List;
      if (response.statusCode == 200) {
        expertsList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          expertsList.add(Appointment.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }
}
