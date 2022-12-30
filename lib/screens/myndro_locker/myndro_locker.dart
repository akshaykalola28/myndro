import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/myndro_locker/myndro_document.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class MyndroLockerScreen extends GetView<MyndroLockerController> {
  static const pageId = "/MyndroLockerScreen";

  MyndroLockerScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
        body: LayoutWidget(
          isAssessment: false,
          text: 'Myndro Locker',
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      outlinedTextField(
                          controller.caseNoController,
                          false,
                          Common.validateCaseNo,
                          TextInputType.text,
                          'Case No.',
                          1),
                      const SizedBox(
                        height: 15,
                      ),
                      outlinedTextField(
                          controller.docTitleController,
                          false,
                          Common.validateDocTitle,
                          TextInputType.multiline,
                          'Document Title',
                          8),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: ColorsConfig.colorWhite,

                                border: Border.all(
                                    color: ColorsConfig.colorBlue, width: 1.0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                        25.0)), // Set rounded corner radius
                                // Make rounded corner of border
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Obx(
                                () => Row(
                                  children: [
                                    Text(
                                      controller.attachedDocName.value,
                                      style: const TextStyle(
                                          color: ColorsConfig.colorGreyy,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.attach_file,
                                      color: ColorsConfig.colorGreyy,
                                      size: 28,
                                    )
                                  ],
                                ),
                              )),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () async {
                              FilePickerResult? pickedResult =
                                  await FilePicker.platform.pickFiles();
                              if (pickedResult != null) {
                                File file =
                                    File(pickedResult.files.single.path ?? '');
                                controller.attachedDocName.value =
                                    file.path.split('/').last;
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: const CircleAvatar(
                              backgroundColor: ColorsConfig.colorBlue,
                              radius: 18,
                              child: Icon(Icons.add,
                                  size: 28, color: ColorsConfig.colorWhite),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: (() {
                          if (_formKey.currentState!.validate()) {
                            // controller.createLockerData();
                            controller.getLockerDataList();
                            Get.toNamed(MyndroDocumentScreen.pageId);
                          }
                        }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          decoration: const BoxDecoration(
                            color: ColorsConfig.colorBlue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 16.0,
                              color: ColorsConfig.colorWhite,
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
