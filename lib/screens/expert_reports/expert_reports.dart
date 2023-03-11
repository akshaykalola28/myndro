import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../services/services.dart';
import '../../util/common.dart';

class ExpertReports extends GetView<ExpertReportsController> {
  static const pageId = "/ExpertReports";

  const ExpertReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
          leadingIcon: Icons.arrow_back,
          onDrawerClick: () {
            Get.back();
          },
          text: 'Reports',
          body: Obx(() => GestureDetector(
              onTap: () {
                Get.focusScope!.unfocus();
              },
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: Row(
                        children: [
                          Expanded(
                            // flex: 2,
                            child: TextField(
                                controller: controller.searchController,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color:
                                      ColorsConfig.colorWhite.withOpacity(0.8),
                                ),
                                onChanged: (_) {
                                  if (controller.tabController.index == 0) {
                                    controller.expertToPatientReport();
                                  } else {
                                    controller.myndroToExpertReport();
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    color: ColorsConfig.colorWhite
                                        .withOpacity(0.8),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none),
                                )),
                          ),
                          /*     Expanded(
                            child: GetBuilder<ExpertReportsController>(
                                builder: (con) {
                              return Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text(
                                      'Sort By',
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 16.0,
                                        color: ColorsConfig.colorBlack,
                                      ),
                                    ),
                                    onChanged: (String? newValue) {
                                      controller
                                          .setSelectedSortValue(newValue!);
                                    },
                                    iconSize: 35,
                                    iconEnabledColor: ColorsConfig.colorBlack,
                                    value: controller.sortValue,
                                    items: controller.sortingList
                                        .map((selectedType) {
                                      return DropdownMenuItem<String>(
                                        value: selectedType,
                                        child: Text(
                                          selectedType,
                                          style: TextStyle(
                                            fontFamily:
                                                AppTextStyle.microsoftJhengHei,
                                            fontSize: 18.0,
                                            color: ColorsConfig.colorBlack,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            }),
                          ), */
                        ],
                      ),
                    )),
                    Obx(() => SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DateTimeFieldWidget(
                                      dateText: controller
                                                  .formattedFromDate.value !=
                                              ''
                                          ? controller.formattedFromDate.value
                                          : 'From',
                                      onClick: () =>
                                          controller.selectFromDate(context)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: DateTimeFieldWidget(
                                      dateText:
                                          controller.formattedToDate.value != ''
                                              ? controller.formattedToDate.value
                                              : 'To',
                                      onClick: () {
                                        controller.selectToDate(context);
                                        if (controller
                                                    .formattedFromDate.value !=
                                                '' &&
                                            controller.formattedToDate.value !=
                                                '') {
                                          if (controller.tabController.index ==
                                              0) {
                                            controller.expertToPatientReport();
                                          } else {
                                            controller.myndroToExpertReport();
                                          }
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                            child: TabBar(
                                controller: controller.tabController,
                                isScrollable: false,
                                onTap: (value) {
                                  controller.searchController.clear();
                                  if (controller.tabController.index == 0) {
                                    controller.expertToPatientReport();
                                  } else {
                                    controller.myndroToExpertReport();
                                  }
                                },
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    25.0,
                                  ),
                                  color: ColorsConfig.colorBlue,
                                ),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                tabs: controller.myTabs),
                          ),
                        ],
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    controller.isLoading.value
                        ? const MyndroLoader()
                        : controller.exToPatientList.isEmpty
                            ? Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                width: Get.width,
                                child: Text('No Data Found',
                                    style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 15.0,
                                      color: ColorsConfig.colorBlack,
                                    )))
                            : ListView.builder(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 30),
                                primary: true,
                                itemCount: controller.exToPatientList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return reportDataTile(
                                      controller.exToPatientList[index]
                                              .patientName ??
                                          '',
                                      controller.exToPatientList[index]
                                              .appointmentDate ??
                                          '',
                                      controller
                                              .exToPatientList[index].caseNo ??
                                          '',
                                      controller.exToPatientList[index]
                                              .audioVideo ??
                                          '',
                                      controller.exToPatientList[index].type ??
                                          '',
                                      () => controller.startMeetByDr(
                                          context,
                                          controller.exToPatientList[index]
                                                  .meetingId ??
                                              ''),
                                      () => Common.launchCallURL(context,
                                          '${Apis.webViewUrl}${controller.exToPatientList[index].invoiceUrl ?? ''}'));
                                })),
                    controller.isMyndroToExLoading.value
                        ? const MyndroLoader()
                        : controller.myToExpertList.isEmpty
                            ? Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                width: Get.width,
                                child: Text('No Data Found',
                                    style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 15.0,
                                      color: ColorsConfig.colorBlack,
                                    )))
                            : ListView.builder(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 30),
                                primary: false,
                                itemCount: controller.myToExpertList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return reportDataTile(
                                      controller.myToExpertList[index]
                                              .doctorName ??
                                          '',
                                      controller.myToExpertList[index]
                                              .appointmentDate ??
                                          '',
                                      controller
                                              .myToExpertList[index].caseNo ??
                                          '',
                                      controller.myToExpertList[index]
                                              .audioVideo ??
                                          '',
                                      controller.myToExpertList[index].type ??
                                          '',
                                      () => controller.startMeetByDr(
                                          context,
                                          controller.myToExpertList[index]
                                                  .meetingId ??
                                              ''),
                                      () => Common.launchCallURL(context,
                                          ' ${Apis.webViewUrl}${controller.myToExpertList[index].invoiceUrl ?? ''}'));
                                })),
                  ],
                  controller: controller.tabController,
                ),
              )))),
    );
  }

  Widget reportDataTile(
    String name,
    String date,
    String caseNo,
    String callType,
    String appoType,
    VoidCallback onClickCall,
    VoidCallback onClickFile,
  ) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(ImagePath.iconHuman)),
                    color: ColorsConfig.colorBlue,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 18.0,
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
                          fontSize: 14.0,
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
                          fontSize: 14.0,
                          color: ColorsConfig.colorGreyy,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                appoType,
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    color: ColorsConfig.colorBlue,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onClickCall,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: ColorsConfig.colorBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Icon(
                      callType.toLowerCase().contains('audio')
                          ? Icons.phone
                          : Icons.videocam,
                      color: ColorsConfig.colorWhite,
                      size: 23),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: onClickFile,
                  icon: const Icon(
                    Icons.file_copy_rounded,
                    color: Colors.red,
                    size: 30,
                  ))
              // Image.asset(
              //   ImagePath.iconFile,
              //   height: 40,
              //   width: 40,
              // ),
              // IconButton(
              //   onPressed: () {
              //     // controller.showPopupMenu(context, offset)
              //   },
              //   icon: const Icon(Icons.add),
              //   color: ColorsConfig.colorGreyy,
              // )
            ],
          ),
        ));
  }
}
