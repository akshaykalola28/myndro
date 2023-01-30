import 'dart:convert';

import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class PrescriptionDetailController extends BaseController {
  @override
  void errorHandler(e) {}
  RxBool isLoading = false.obs;
  List<PreDetailsData> prescDetailList = <PreDetailsData>[].obs;
  dynamic getPrescData;
  @override
  void onInit() async {
    super.onInit();
    getPrescData = Get.arguments;
    getPrescByPrescId(getPrescData['prescDetail'].prescriptionId);
  }

  void getPrescByPrescId(String prescId) async {
    bool status = await Common.checkInternetConnection();

    isLoading.value = true;
    if (status) {
      var response =
          await RemoteServices.getPrescriptionDetailForPatientSide(prescId);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['pre_details'] as List;
      if (response.statusCode == 200) {
        prescDetailList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          prescDetailList.add(PreDetailsData.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
