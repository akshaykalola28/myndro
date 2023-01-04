import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';
import '../widgets/widgets.dart';
import 'controller.dart';

class ExpertTodayAppoController extends BaseController {
  @override
  void errorHandler(e) {}
  RxBool isLoading = false.obs;
  final TextEditingController noteTextEditingController =
      TextEditingController();
  List<ExpertNotesForExpertList> notesByAppoId =
      <ExpertNotesForExpertList>[].obs;
  final formKey = GlobalKey<FormState>();
  void getnotesByAppoId(int appointmentId) async {
    bool status = await Common.checkInternetConnection();

    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getNotesForExpertSide(appointmentId);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        notesByAppoId.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          notesByAppoId.add(ExpertNotesForExpertList.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  void createExpertPackages(int appointmentId, String patientId) async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.expertCreateNote(
          res.isNotEmpty ? jsonDecode(res)['data']['doctor_id'] : '',
          patientId,
          noteTextEditingController.text);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        getnotesByAppoId(appointmentId);
        noteTextEditingController.clear();
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  displayDialog(
      BuildContext context, int appointmentId, String patientId) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Note'),
          content: Builder(
            builder: (context) {
              var width = MediaQuery.of(context).size.width;

              return SizedBox(
                width: width,
                child: Form(
                  key: formKey,
                  child: outlinedTextField(noteTextEditingController, false,
                      Common.validateNotes, TextInputType.text, 'Note', 4),
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 18.0,
                  color: ColorsConfig.colorBlue,
                ),
              ),
              onPressed: () {
                Get.back();
                noteTextEditingController.clear();
              },
            ),
            TextButton(
              child: Text(
                'Add Note',
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 18.0,
                  color: ColorsConfig.colorBlue,
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  createExpertPackages(appointmentId, patientId);
                  Get.back();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
