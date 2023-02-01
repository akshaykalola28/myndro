import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../services/services.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class PrescriptionScreen extends GetView<PrescriptionDetailController> {
  static const pageId = "/PrescriptionScreen";

  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: LayoutWidget(
            isAssessment: false,
            body: Obx(
              () => controller.isLoading.value
                  ? const MyndroLoader()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Prescription',
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 24.0,
                              color: ColorsConfig.colorBlack,
                              fontWeight: FontWeight.w900),
                        ),
                        Expanded(
                            child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          itemCount: controller.prescDetailList.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 70),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: dataContainer(
                                                'Date ${controller.prescDetailList[index].dateCreated}')),
                                        // const SizedBox(
                                        //   width: 15,
                                        // ),
                                        // Expanded(child: dataContainer('Time')),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Material(
                                elevation: 3,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Container(
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: ColorsConfig.colorGrey
                                          .withOpacity(0.5),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        textConatiner('Medicine Name'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          controller.prescDetailList[index]
                                                  .medicineName ??
                                              '',
                                          style: TextStyle(
                                              fontFamily: AppTextStyle
                                                  .microsoftJhengHei,
                                              fontSize: 19.0,
                                              color: ColorsConfig.colorGreyy,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Divider(
                                              color: ColorsConfig.colorBlack),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        textConatiner('Instruction'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          controller.prescDetailList[index]
                                                  .insName ??
                                              '',
                                          style: TextStyle(
                                              fontFamily: AppTextStyle
                                                  .microsoftJhengHei,
                                              fontSize: 19.0,
                                              color: ColorsConfig.colorGreyy,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Divider(
                                              color: ColorsConfig.colorBlack),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        textConatiner('Frequency'),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Text(
                                        //       'Morning',
                                        //       style: TextStyle(
                                        //           fontFamily:
                                        //               AppTextStyle.microsoftJhengHei,
                                        //           fontSize: 18.0,
                                        //           color: ColorsConfig.colorGreyy,
                                        //           fontWeight: FontWeight.w800),
                                        //     ),
                                        //     Text(
                                        //       'Afternoon',
                                        //       style: TextStyle(
                                        //           fontFamily:
                                        //               AppTextStyle.microsoftJhengHei,
                                        //           fontSize: 18.0,
                                        //           color: ColorsConfig.colorGreyy,
                                        //           fontWeight: FontWeight.w800),
                                        //     ),
                                        //     Text(
                                        //       'Evening',
                                        //       style: TextStyle(
                                        //           fontFamily:
                                        //               AppTextStyle.microsoftJhengHei,
                                        //           fontSize: 18.0,
                                        //           color: ColorsConfig.colorGreyy,
                                        //           fontWeight: FontWeight.w800),
                                        //     ),
                                        //   ],
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        const Divider(
                                            color: ColorsConfig.colorBlack,
                                            height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            controller.prescDetailList[index]
                                                    .frequency!
                                                    .toLowerCase()
                                                    .contains('morning')
                                                ? Text(
                                                    'Morning',
                                                    style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 18.0,
                                                        color: ColorsConfig
                                                            .colorGreyy,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  )
                                                : Text(
                                                    '',
                                                    style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 18.0,
                                                        color: ColorsConfig
                                                            .colorGreyy,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                            controller.prescDetailList[index]
                                                    .frequency!
                                                    .toLowerCase()
                                                    .contains('afternoon')
                                                ? Text(
                                                    'Afternoon',
                                                    style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 18.0,
                                                        color: ColorsConfig
                                                            .colorGreyy,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  )
                                                : Text(
                                                    '',
                                                    style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 18.0,
                                                        color: ColorsConfig
                                                            .colorGreyy,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                            controller.prescDetailList[index]
                                                    .frequency!
                                                    .toLowerCase()
                                                    .contains('evening')
                                                ? Text(
                                                    'Evening',
                                                    style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 18.0,
                                                        color: ColorsConfig
                                                            .colorGreyy,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  )
                                                : Text(
                                                    '',
                                                    style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 18.0,
                                                        color: ColorsConfig
                                                            .colorGreyy,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Divider(
                                            color: ColorsConfig.colorBlack,
                                            height: 10),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () {
                                              Get.toNamed(WebViewScreen.pageId,
                                                  arguments: {
                                                    'meetDetail':
                                                        '${Apis.webViewUrl}${controller.prescDetailList[index].attachment}'

                                                    //  controller
                                                    //     .prescDetailList[index]
                                                    //     .attachment,
                                                  });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,

                                                border: Border.all(
                                                    color: Colors.red,
                                                    width: 1.0),
                                                borderRadius: const BorderRadius
                                                        .all(
                                                    Radius.circular(
                                                        25.0)), // Set rounded corner radius
                                                // Make rounded corner of border
                                              ),
                                              padding: const EdgeInsets.all(6),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: const [
                                                  Text(
                                                    'Attachment',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.attach_file,
                                                    color: Colors.red,
                                                    size: 25,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
            ),
            text: 'Prescription'),
      ),
    );
  }

  Widget dataContainer(String text) {
    return Material(
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
        child: Text(
          text,
          style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 14.0,
              color: ColorsConfig.colorGreyy,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget textConatiner(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: const BoxDecoration(
        color: ColorsConfig.colorBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: AppTextStyle.microsoftJhengHei,
            fontSize: 20.0,
            color: ColorsConfig.colorWhite,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
