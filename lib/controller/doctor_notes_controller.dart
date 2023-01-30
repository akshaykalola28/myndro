import 'dart:convert';

import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class DoctorNotesController extends BaseController {
  @override
  void errorHandler(e) {}
  RxBool isLoading = false.obs;
  List<ExpertNotesForExpertList> notesList = <ExpertNotesForExpertList>[].obs;
  List<PreDetails> prescriptionList = <PreDetails>[].obs;

  @override
  void onInit() async {
    super.onInit();
    getnotesByPatientId();
    getPrescriptionByPatientId();
  }

  void getnotesByPatientId() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getNotesForPatientSide(
          jsonDecode(res)['PatientData']['patient_id']);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        notesList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          notesList.add(ExpertNotesForExpertList.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  void getPrescriptionByPatientId() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getPrescriptionForPatientSide(
          jsonDecode(res)['PatientData']['patient_id']);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['pre_details'] as List;
      if (response.statusCode == 200) {
        prescriptionList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          prescriptionList.add(PreDetails.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
