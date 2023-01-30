import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:http/http.dart' as http;
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
  RxBool isPrescLoading = false.obs;
  dynamic getExpertData;
  final TextEditingController noteTextEditingController =
      TextEditingController();
  final TextEditingController medNameController = TextEditingController();
  final TextEditingController instructionController = TextEditingController();
  List<ExpertNotesForExpertList> notesByAppoId =
      <ExpertNotesForExpertList>[].obs;
  List<PreDetail> prescByAppoId = <PreDetail>[].obs;
  FilePickerResult? pickedAttachment;
  var attachemntTxt = 'Add Attachment'.obs;
  final formKey = GlobalKey<FormState>();
  List<OnBoardingModel> selectedFrequency = [];

  List<OnBoardingModel> frequencyList = [
    OnBoardingModel(imageAsset: '', name: 'Morning'),
    OnBoardingModel(imageAsset: '', name: 'Afternoon'),
    OnBoardingModel(imageAsset: '', name: 'Evening'),
  ];
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

//expert presc list
  void getPrescriByAppoId(int appointmentId) async {
    bool status = await Common.checkInternetConnection();

    isPrescLoading.value = true;
    if (status) {
      dynamic prescDetail;
      var response =
          await RemoteServices.getPrescriptionForExpertSide(appointmentId);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['pre_details'] as List;

      prescDetail = data.map((e) => e[0]).toList();
      if (response.statusCode == 200) {
        prescByAppoId.clear();
        isPrescLoading.value = false;
        for (dynamic i in prescDetail) {
          prescByAppoId.add(PreDetail.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  void addPrescription(int appointmentId) async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.createPrescExpert));
      request.fields.addAll({
        'doctor_id': jsonDecode(res)['data']['doctor_id'],
        'patient_id': getExpertData['appoDetail'].patientId ?? '',
        'frequency[]':
            jsonEncode(selectedFrequency.map((e) => e.name).toList()),
        'case_no': getExpertData['appoDetail'].caseNo ?? '',
        'appointment_id': getExpertData['appoDetail'].appointmentId ?? '',
        'txtMedicineName': medNameController.text.trim(),
        'txtDescription': instructionController.text.trim()
      });
      request.files.add(await http.MultipartFile.fromPath(
          'preceptionaAttachment', pickedAttachment?.files.single.path ?? ''));

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        Common.displayMessage(jsonData["msg"] as String);
        print('jsonDatahhhhhh $jsonData');
        getPrescriByAppoId(appointmentId);
        medNameController.clear();
        instructionController.clear();
        selectedFrequency.clear();
        // pickedAttachment?.files.clear();
      } else {
        Common.displayMessage(jsonData["msg"] as String);
        print(response.reasonPhrase);
      }
    }
  }

  void createExpertNote(int appointmentId, String patientId) async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.expertCreateNote(
          res.isNotEmpty ? jsonDecode(res)['data']['doctor_id'] : '',
          patientId,
          noteTextEditingController.text,
          getExpertData['appoDetail'].appointmentId);
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
                  createExpertNote(appointmentId, patientId);
                  Get.back();
                }
              },
            ),
          ],
        );
      },
    );
  }

  displayPrescriptionDialog(
      BuildContext context, int appointmentId, String patientId) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Prescription'),
          content: Builder(
            builder: (context) {
              var width = MediaQuery.of(context).size.width;

              return SizedBox(
                width: width,
                child: Form(
                  key: formKey,
                  child: Obx(() => SingleChildScrollView(
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            outlinedTextField(
                                medNameController,
                                false,
                                Common.validateMedName,
                                TextInputType.text,
                                'Medicine Name',
                                1),
                            const SizedBox(
                              height: 10,
                            ),
                            outlinedTextField(
                                instructionController,
                                false,
                                Common.validateInstruction,
                                TextInputType.multiline,
                                'Instruction(s)',
                                2),
                            const SizedBox(
                              height: 10,
                            ),
                            MultiSelectDialogField(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              title: const Text('Medicine Frequency'),
                              searchHint: 'Medicine Frequency',
                              buttonIcon: const Icon(Icons.add),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Select Medicine Frequency';
                                } else {
                                  return null;
                                }
                              },
                              buttonText: const Text('Medicine Frequency'),
                              items: frequencyList
                                  .map((e) => MultiSelectItem(e, e.name))
                                  .toList(),
                              listType: MultiSelectListType.LIST,
                              onConfirm: (List<OnBoardingModel> values) {
                                selectedFrequency = values;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () async {
                                  pickedAttachment =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: [
                                      'jpg',
                                      'pdf',
                                      'png',
                                      'jpeg'
                                    ],
                                  );
                                  if (pickedAttachment != null) {
                                    File file = File(
                                        pickedAttachment?.files.single.path ??
                                            '');

                                    attachemntTxt.value =
                                        file.path.split('/').last;
                                    update();
                                  } else {
                                    // User canceled the picker
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,

                                    border: Border.all(
                                        color: ColorsConfig.colorBlue,
                                        width: 1.0),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                            25.0)), // Set rounded corner radius
                                    // Make rounded corner of border
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        attachemntTxt.value,
                                        style: const TextStyle(
                                            color: ColorsConfig.colorBlue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.attach_file,
                                        color: ColorsConfig.colorBlue,
                                        size: 25,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
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
                medNameController.clear();
                instructionController.clear();
                selectedFrequency.clear();
                // pickedAttachment?.files.clear();
              },
            ),
            TextButton(
              child: Text(
                'Add Prescription',
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 18.0,
                  color: ColorsConfig.colorBlue,
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  addPrescription(appointmentId);
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
