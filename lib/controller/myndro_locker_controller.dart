import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class MyndroLockerController extends BaseController {
  @override
  void errorHandler(e) {}
  final TextEditingController caseNoController = TextEditingController();
  final TextEditingController docTitleController = TextEditingController();
  var lockerList = <PatientDocs>[].obs;
  var attachedDocName = 'Attach Document'.obs;
  @override
  void onInit() {
    // getLockerDataList();
    super.onInit();
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
          child: Text('Share view'),
        ),
      ],
      elevation: 8.0,
    );
  }

  void getLockerDataList() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.getLockerDataList(
        int.parse(jsonDecode(res)['PatientData']['patient_id']),
      );
      var jsonData = json.decode(response.body);
      var data = jsonData["patient_docs"] as List;
      if (response.statusCode == 200) {
        for (dynamic i in data) {
          lockerList.add(PatientDocs.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }

  void createLockerData() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.createPatientLocker(
          int.parse(jsonDecode(res)['PatientData']['patient_id']),
          docTitleController.text.trim(),
          caseNoController.text.trim(),
          attachedDocName.value);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200 && jsonData['type'] != 'error') {
        Common.displayMessage(jsonData["msg"] as String);
        Get.toNamed(MyndroDocumentScreen.pageId);
        caseNoController.clear();
        docTitleController.clear();
        attachedDocName.value = 'Attach Document';
        getLockerDataList();
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
