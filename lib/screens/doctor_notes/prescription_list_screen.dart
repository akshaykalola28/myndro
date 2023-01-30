import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/util/common.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class PrescriptionListScreen extends GetView<DoctorNotesController> {
  static const pageId = "/PrescriptionListScreen";

  const PrescriptionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: GestureDetector(
            onTap: () {
              Get.focusScope!.unfocus();
            },
            child: LayoutWidget(
                isAssessment: false,
                body: controller.isLoading.value
                    ? const MyndroLoader()
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        itemCount: controller.prescriptionList.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return prescriptionList(
                            controller.prescriptionList[index].caseNo ?? '',
                            controller.prescriptionList[index].dateApt == null
                                ? ''
                                : Common.formatLockerDate(
                                    controller.prescriptionList[index].dateApt),
                            () => Get.toNamed(PrescriptionScreen.pageId,
                                arguments: {
                                  'prescDetail':
                                      controller.prescriptionList.isNotEmpty
                                          ? controller.prescriptionList[index]
                                          : null,
                                }),
                          );
                        })),
                text: 'Prescription List'))));
  }

  Widget prescriptionList(
    String caseNo,
    String appoDate,
    VoidCallback onViewClick,
  ) {
    return ListTile(
      title: Text(
        'Case No: $caseNo',
        softWrap: true,
        style: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 18.0,
        ),
      ),
      subtitle: Text(
        'Appointment Date : $appoDate',
        softWrap: true,
        style: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 16.0,
        ),
      ),
      trailing: GestureDetector(
        onTap: onViewClick,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: ColorsConfig.colorGreyy,
              )),
          child: Text(
            'view',
            style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 15.0,
                color: ColorsConfig.colorGreyy,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
