import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
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
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              controller: controller.searchController,
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 15.0,
                                color: ColorsConfig.colorWhite.withOpacity(0.8),
                              ),
                              onChanged: (_) {
                                controller.getPatientsList();
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                fillColor: ColorsConfig.colorBlue,
                                filled: true,
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: ColorsConfig.colorWhite,
                                ),
                                hintText: 'Search something ...',
                                hintStyle: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color:
                                      ColorsConfig.colorWhite.withOpacity(0.8),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none),
                              )),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 5,
                            ),
                            itemCount: controller.patientsList.length,
                            itemBuilder: (context, index) =>
                                AppointmentListWidget(
                              userName:
                                  controller.patientsList[index].patientName,
                              title: controller.patientsList[index].patientName,
                              subTitle: controller
                                      .patientsList[index].appointmentDate ??
                                  '',
                              time: controller
                                  .patientsList[index].appointmentTime,
                              caseNo: controller.patientsList[index].caseNo,
                              onClick: () => Get.toNamed(ExpertMessages.pageId,
                                  arguments: {
                                    'patientId': controller
                                            .patientsList[index].patientId ??
                                        '',
                                    'appointmentId': controller
                                            .patientsList[index]
                                            .appointmentId ??
                                        '',
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
            )));
  }
}
