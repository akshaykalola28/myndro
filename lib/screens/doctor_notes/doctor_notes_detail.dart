import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/widgets/layout_widget.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';

class DoctorNotesDetail extends GetView<DoctorNotesController> {
  static const pageId = "/DoctorNotesDetail";

  const DoctorNotesDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: LayoutWidget(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Notes',
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 22.0,
                          color: ColorsConfig.colorBlack,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return dataContainer(
                              'case NO',
                              'Date of Appointment',
                              'hello',
                              'loreal ipsum loreal ipsum loreal ipsum loreal ipsum',
                              "10th june 2022");
                        }),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 35,
                          );
                        },
                      ),
                    )
                  ]),
            ),
            isAssessment: false,
            text: 'Doctor Notes'),
      ),
    );
  }

  Widget dataContainer(String caseNo, String dateOfAppointment, String title,
      String subject, String date) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              elevation: 3,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorsConfig.colorGrey.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Case No:  $caseNo',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 14.0,
                      color: ColorsConfig.colorGreyy,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Material(
              elevation: 3,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorsConfig.colorGrey.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  dateOfAppointment,
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 14.0,
                      color: ColorsConfig.colorGreyy,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        Material(
          elevation: 3,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: ColorsConfig.colorGrey.withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 16.0,
                      color: ColorsConfig.colorBlack,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  subject,
                  softWrap: true,
                  maxLines: 10,
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 14.0,
                      color: ColorsConfig.colorGreyy,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  date,
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 10.0,
                      color: ColorsConfig.colorGreyy,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
