import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/expert_patient_info/expert_patient_detail.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class ExpertAllPatients extends GetView<ExpertPatientInfoController> {
  static const pageId = "/ExpertAllPatients";

  const ExpertAllPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
          leadingIcon: Icons.arrow_back,
          onDrawerClick: () {
            Get.back();
          },
          text: 'List of All Patient',
          body: GestureDetector(
            onTap: () {
              Get.focusScope!.unfocus();
            },
            child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 15.0,
                                color: ColorsConfig.colorWhite.withOpacity(0.8),
                              ),
                              onChanged: (_) {},
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
                          child: GetBuilder<ExpertPatientInfoController>(
                              builder: (con) {
                            return Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                    controller.setSelectedSortValue(newValue!);
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
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DateTimeFieldWidget(
                              dateText: controller.formattedFromDate.value,
                              onClick: () =>
                                  controller.selectFromDate(context)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DateTimeFieldWidget(
                              dateText: controller.formattedToDate.value,
                              onClick: () => controller.selectToDate(context)),
                        ),
                      ],
                    ),
                    ListView.builder(
                        primary: false,
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return appointmentContainer(
                            'abc',
                            '19 jan',
                            'M 001',
                            () {
                              Get.toNamed(ExpertPatientDetail.pageId);
                            },
                          );
                        }))
                  ],
                )),
          )),
    );
  }

  Widget appointmentContainer(
      String name, String date, String caseNo, VoidCallback onCardClick) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onCardClick,
      child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(23),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(ImagePath.iconHuman)),
                      color: ColorsConfig.colorBlue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                  color: ColorsConfig.colorBlue,
                                )),
                            child: Text(
                              'Package',
                              style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color: ColorsConfig.colorBlue,
                                  fontWeight: FontWeight.bold),
                            ),
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
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: ColorsConfig.colorBlue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Icon(Icons.videocam,
                            color: ColorsConfig.colorWhite, size: 32),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
