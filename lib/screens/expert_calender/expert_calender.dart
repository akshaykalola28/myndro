import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class ExpertCalender extends GetView<ExpertCalenderController> {
  static const pageId = "/ExpertCalender";

  const ExpertCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
        leadingIcon: Icons.arrow_back,
        onDrawerClick: () {
          Get.back();
        },
        text: 'Calender',
        body: Obx(() {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Date',
                  style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: ColorsConfig.colorBlack,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DateTimeFieldWidget(
                          dateText: controller.formattedFromDate.value,
                          onClick: () => controller.selectFromDate(context)),
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
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Time',
                  style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: ColorsConfig.colorBlack,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DateTimeFieldWidget(
                          isTime: true,
                          dateText:
                              controller.selectedTime.value.format(context),
                          onClick: () => controller.selectTime(context)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DateTimeFieldWidget(
                          isTime: true,
                          dateText:
                              controller.selectedTime.value.format(context),
                          onClick: () => controller.selectTime(context)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // width: Get.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ColorsConfig.colorBlack,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '5:00 AM - 5:30 AM',
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 18.0,
                              color: ColorsConfig.colorBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                          color: ColorsConfig.colorBlue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: ColorsConfig.colorBlue,
                          )),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 15.0,
                            color: ColorsConfig.colorWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    decoration: BoxDecoration(
                        color: ColorsConfig.colorBlue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: ColorsConfig.colorBlue,
                        )),
                    child: Text(
                      'Allot',
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 20.0,
                          color: ColorsConfig.colorWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
