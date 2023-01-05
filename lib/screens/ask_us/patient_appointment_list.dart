import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/ask_us/ask_us_screen.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class PatientAppoList extends GetView<PatientAppoController> {
  static const pageId = "/PatientAppointmentList";

  const PatientAppoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutWidget(
        body: Obx(
          () => controller.isLoading.value
              ? const MyndroLoader()
              : ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: controller.expertsList.length,
                  itemBuilder: (context, index) => AppointmentListWidget(
                    userName: controller.expertsList[index].doctorName,
                    title: controller.expertsList[index].doctorName,
                    subTitle: controller.expertsList[index].appointmentDate,
                    time: controller.expertsList[index].appointmentTime,
                    caseNo: controller.expertsList[index].caseNo,
                    onClick: () => Get.toNamed(AskUSScreen.pageId, arguments: {
                      'doctorId': controller.expertsList[index].doctorId ?? '',
                      'appointmentId':
                          controller.expertsList[index].appointmentId ?? '',
                    }),
                  ),
                ),
        ),
        isAssessment: false,
        text: 'Experts List',
      ),
    );
  }
}
