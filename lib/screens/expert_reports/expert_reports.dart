import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';

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
          body: GestureDetector(
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
                            flex: 2,
                            child: TextField(
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color:
                                      ColorsConfig.colorWhite.withOpacity(0.8),
                                ),
                                onChanged: (_) {},
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
                          Expanded(
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
                          ),
                        ],
                      ),
                    )),
                    Obx(
                      () => SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: DateTimeFieldWidget(
                                    dateText:
                                        controller.formattedFromDate.value,
                                    onClick: () =>
                                        controller.selectFromDate(context)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: DateTimeFieldWidget(
                                    dateText: controller.formattedToDate.value,
                                    onClick: () =>
                                        controller.selectToDate(context)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                            child: TabBar(
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
                          ),
                        ],
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ListView.builder(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 30),
                        primary: true,
                        itemCount: 6,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return reportDataTile('abc', '19 jan', 'M 001');
                        })),
                    ListView.builder(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 30),
                        primary: false,
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return reportDataTile('abc', '19 jan', 'M 001');
                        })),
                  ],
                  controller: controller.tabController,
                ),
              ))),
    );
  }

  Widget reportDataTile(
    String name,
    String date,
    String caseNo,
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
              Column(
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
              const Spacer(),
              Text(
                'package',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    color: ColorsConfig.colorBlue,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: ColorsConfig.colorBlue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Icon(Icons.videocam,
                    color: ColorsConfig.colorWhite, size: 23),
              ),
              const Spacer(),
              Image.asset(
                ImagePath.pdfIconImg,
                height: 40,
                width: 40,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // controller.showPopupMenu(context, offset)
                },
                icon: const Icon(Icons.add),
                color: ColorsConfig.colorGreyy,
              )
            ],
          ),
        ));
  }
}
