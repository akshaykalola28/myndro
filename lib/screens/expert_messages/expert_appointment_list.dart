import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class ExpertAppointmentList extends GetView<ExpertAppoController> {
  static const pageId = "/ExpertAppointmentList";

  const ExpertAppointmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExpertLayout(
            leadingIcon: Icons.arrow_back,
            onDrawerClick: () {
              Get.back();
            },
            text: 'Patients List',
            body: Obx(
              () => controller.isLoading.value
                  ? const MyndroLoader()
                  : ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemCount: controller.patientsList.length,
                      itemBuilder: (context, index) => AppointmentListWidget(
                        userName: controller.patientsList[index].patientName,
                        title: controller.patientsList[index].patientName,
                        subTitle:
                            controller.patientsList[index].appointmentDate ??
                                '',
                        time: controller.patientsList[index].appointmentTime,
                        caseNo: controller.patientsList[index].caseNo,
                        onClick: () =>
                            Get.toNamed(ExpertMessages.pageId, arguments: {
                          'patientId':
                              controller.patientsList[index].patientId ?? '',
                          'appointmentId':
                              controller.patientsList[index].appointmentId ??
                                  '',
                        }),
                      ),
                    ),
            )));
  }
}
