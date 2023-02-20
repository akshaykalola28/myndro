import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../util/common.dart';
import '../../widgets/widgets.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../screens.dart';

class UpcomingAppointments extends GetView<HomeController> {
  static const pageId = "/UpcomingAppointments";

  const UpcomingAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Obx(() => Scaffold(
            body: LayoutWidget(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Upcoming Appointment',
                    //   style: TextStyle(
                    //     fontFamily: AppTextStyle.microsoftJhengHei,
                    //     fontSize: 18.0,
                    //     fontWeight: FontWeight.w600,
                    //     color: ColorsConfig.colorBlack,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    controller.isLoading.value
                        ? const MyndroLoader()
                        : Expanded(
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 15, 12, 10),
                              itemCount: controller.patientAppoList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(UpcomingAppointments.pageId),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.account_circle_rounded,
                                          size: 38,
                                          color: ColorsConfig.colorBlue),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              controller.patientAppoList[index]
                                                      .doctorName ??
                                                  '',
                                              style: TextStyle(
                                                fontFamily: AppTextStyle
                                                    .microsoftJhengHei,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: ColorsConfig.colorBlack,
                                              )),
                                          SizedBox(
                                            width: Get.width * 0.3,
                                            child: Text(
                                                controller
                                                        .patientAppoList[index]
                                                        .doctorProfession ??
                                                    '',
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 13.0,
                                                  color:
                                                      ColorsConfig.colorGreyy,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                              controller.patientAppoList[index]
                                                      .appointmentDate ??
                                                  '',
                                              // Common.formatLockerDate(
                                              //   controller
                                              //           .patientAppoList[index]
                                              //           .appointmentDate ??
                                              //       '',
                                              // ),
                                              style: TextStyle(
                                                fontFamily: AppTextStyle
                                                    .microsoftJhengHei,
                                                fontSize: 15.0,
                                                color: ColorsConfig.colorBlack,
                                              )),
                                          Text(
                                              controller.patientAppoList[index]
                                                      .appointmentTime ??
                                                  '',
                                              style: TextStyle(
                                                fontFamily: AppTextStyle
                                                    .microsoftJhengHei,
                                                fontSize: 15.0,
                                                color: ColorsConfig.colorBlack,
                                              )),
                                        ],
                                      ),
                                      GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () {
                                          Common.launchCallURL(
                                              context,
                                              controller.patientAppoList[index]
                                                      .appointmentLink ??
                                                  '');
                                          /*     Get.toNamed(WebViewScreen.pageId,
                                              arguments: {
                                                'meetDetail': controller
                                                        .patientAppoList[index]
                                                        .appointmentLink ??
                                                    ''
                                              }); */
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: Icon(
                                              (controller.patientAppoList[index]
                                                      .audioVideo!
                                                      .toLowerCase()
                                                      .contains('audio'))
                                                  ? Icons.phone
                                                  : Icons.videocam,
                                              size: 20,
                                              color: ColorsConfig.colorWhite),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorsConfig.colorBlue),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                            controller.patientAppoList[index]
                                                    .type ??
                                                '',
                                            softWrap: true,
                                            style: TextStyle(
                                              fontFamily: AppTextStyle
                                                  .microsoftJhengHei,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color: ColorsConfig.colorBlack,
                                            )),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: ColorsConfig.colorBlack,
                                );
                              },
                            ),
                          ),
                  ],
                ),
                isAssessment: false,
                text: 'Appointments'),
          )),
    );
  }
}
