import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';

class ExpertAppointment extends GetView<ExpertAppointmentController> {
  static const pageId = "/ExpertAppointment";

  const ExpertAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
        leadingIcon: Icons.arrow_back,
        onDrawerClick: () {
          Get.back();
        },
        body: Obx(() => SingleChildScrollView(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                      controller: controller.searchController,
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 18.0,
                        color: ColorsConfig.colorWhite.withOpacity(0.8),
                      ),
                      onChanged: (_) {},
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        fillColor: ColorsConfig.colorGreyy,
                        filled: true,
                        suffixIcon: const Icon(
                          Icons.search,
                          color: ColorsConfig.colorWhite,
                        ),
                        hintText: 'Search something ...',
                        hintStyle: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorWhite,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                      )),
                  /* Container(
                      decoration: const BoxDecoration(
                        color: ColorsConfig.colorGreyy,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      child: Row(
                        children: [
                          Text(
                            'Search',
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: ColorsConfig.colorWhite.withOpacity(0.8),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.search,
                            color: ColorsConfig.colorWhite,
                          ),
                        ],
                      )
                          ), */
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GetBuilder<ExpertAppointmentController>(
                        builder: (controller) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            hint: Text(
                              'Sort by',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 18.0,
                                color: ColorsConfig.colorBlue,
                              ),
                            ),
                            onChanged: (String? newValue) {
                              controller.setSelected(newValue!);
                            },
                            iconSize: 25,
                            iconEnabledColor: ColorsConfig.colorBlue,
                            value: controller.dropValue,
                            items: controller.sortType.map((selectedType) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  selectedType,
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 18.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                ),
                                value: selectedType,
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Appointments',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 20.0,
                        color: ColorsConfig.colorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.isLoading.value
                      ? const MyndroLoader()
                      : ListView.builder(
                          primary: false,
                          itemCount: controller.appoList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            // if (controller.searchController.text.isEmpty) {
                            return appointmentContainer(
                              controller.appoList[index].patientName ?? '',
                              '${controller.appoList[index].appointmentDate ?? ''} ${controller.appoList[index].appointmentTime ?? ''}',
                              controller.appoList[index].caseNo ?? '',
                              controller.appoList[index].audioVideo ?? '',
                              controller.appoList[index].type ?? '',
                            );
                          }))
                ],
              ),
            ))),
        text: 'Appointment',
      ),
    );
  }

  Widget appointmentContainer(String name, String date, String caseNo,
      String callType, String appoType) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
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
                child: Column(
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
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorGreyy,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          appoType,
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        /*   Text(
                          'Confirmed',
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ), */
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: ColorsConfig.colorBlue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                        callType == 'audio' ? Icons.phone : Icons.videocam,
                        color: ColorsConfig.colorWhite,
                        size: 32),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                ],
              ),
            ],
          ),
        ));
  }
}
