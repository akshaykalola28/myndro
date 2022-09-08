import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class ExpertPatientDetail extends GetView<ExpertPatientInfoController> {
  static const pageId = "/ExpertPatientDetail";

  const ExpertPatientDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
          leadingIcon: Icons.arrow_back,
          onDrawerClick: () {
            Get.back();
          },
          text: 'Patient Detail',
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                patientDetailContainer(
                    '10', '2', 'data', 'female', 'march 10th 1992'),
                const SizedBox(
                  height: 10,
                ),
                TabBar(
                    controller: controller.tabController,
                    isScrollable: false,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: ColorsConfig.colorBlue,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: controller.myTabs),
                ListView.builder(
                    primary: true,
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return appointmentContainer('abc', '19 jan', 'M 001');
                    })),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'View Shared Documents',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 18.0,
                      color: ColorsConfig.colorGreyy,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.white,
                  child: ListView.separated(
                    primary: true,
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.toNamed(ExpertPatientReports.pageId);
                          },
                          child: const ExpertReportTileWidget());
                    }),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notes',
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 20.0,
                          color: ColorsConfig.colorBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Get.toNamed(ExpertPatientNotes.pageId),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
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
                  ],
                ),
                ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 25,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return const ExpertNotesWidget(
                        date: '10th june 2022',
                        title: 'hello',
                        subject:
                            'loreal ipsum loreal ipsum loreal ipsum loreal ',
                      );
                    }),
              ],
            ),
          )),
    );
  }

  Widget patientDetailContainer(String pastAppointments, String upcoming,
      String name, String gender, String bDay) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(ImagePath.iconHuman)),
                        color: ColorsConfig.colorBlue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        pastAppointments,
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 18.0,
                            color: ColorsConfig.colorGreyy,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Past',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 16.0,
                          color: ColorsConfig.colorGreyy,
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(
                      thickness: 2, color: ColorsConfig.colorGreyy),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        upcoming,
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 18.0,
                            color: ColorsConfig.colorGreyy,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Upcoming',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 16.0,
                          color: ColorsConfig.colorGreyy,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 3,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 18.0,
                  color: ColorsConfig.colorGreyy,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 3,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 16.0,
                          color: ColorsConfig.colorGreyy.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        gender,
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 15.0,
                            color: ColorsConfig.colorGreyy,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const VerticalDivider(
                      thickness: 2, color: ColorsConfig.colorGreyy),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Birthday',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 16.0,
                          color: ColorsConfig.colorGreyy.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        bDay,
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 15.0,
                            color: ColorsConfig.colorGreyy,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appointmentContainer(String name, String date, String caseNo) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(23),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(ImagePath.iconHuman)),
                    color: ColorsConfig.colorBlue,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 20.0,
                              color: ColorsConfig.colorGreyy,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: ColorsConfig.colorGreyy.withOpacity(0.8),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Case No.: $caseNo',
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: ColorsConfig.colorGreyy,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Package',
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: ColorsConfig.colorBlue,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            'Confirmed',
                            style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 15.0,
                                color: ColorsConfig.colorWhite,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: ColorsConfig.colorBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Icon(Icons.videocam,
                          color: ColorsConfig.colorWhite, size: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
