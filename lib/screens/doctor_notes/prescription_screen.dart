import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class PrescriptionScreen extends GetView<DoctorNotesController> {
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
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              child: Column(
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
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Column(
                      children: [
                        dataContainer('Case No:'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(child: dataContainer('Date')),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(child: dataContainer('Time')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'data',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorGreyy,
                        fontWeight: FontWeight.w600),
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
                          color: ColorsConfig.colorGrey.withOpacity(0.5),
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
                              'Medicine Name',
                              style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 19.0,
                                  color: ColorsConfig.colorGreyy,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Divider(color: ColorsConfig.colorBlack),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textConatiner('Instruction'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Dummy text',
                              style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 19.0,
                                  color: ColorsConfig.colorGreyy,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Divider(color: ColorsConfig.colorBlack),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textConatiner('Frequency'),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Morning',
                                  style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 18.0,
                                      color: ColorsConfig.colorGreyy,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  'Afternoon',
                                  style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 18.0,
                                      color: ColorsConfig.colorGreyy,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  'Night',
                                  style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 18.0,
                                      color: ColorsConfig.colorGreyy,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,

                                  border:
                                      Border.all(color: Colors.red, width: 1.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                          25.0)), // Set rounded corner radius
                                  // Make rounded corner of border
                                ),
                                padding: const EdgeInsets.all(6),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Attachment',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
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
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider(
                                color: ColorsConfig.colorBlack, height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Morning',
                                  style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 18.0,
                                      color: ColorsConfig.colorGreyy,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  'Night',
                                  style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 18.0,
                                      color: ColorsConfig.colorGreyy,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider(
                                color: ColorsConfig.colorBlack, height: 10),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Afternoon',
                              style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 18.0,
                                  color: ColorsConfig.colorGreyy,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,

                                  border:
                                      Border.all(color: Colors.red, width: 1.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                          25.0)), // Set rounded corner radius
                                  // Make rounded corner of border
                                ),
                                padding: const EdgeInsets.all(6),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Attachment',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.attach_file,
                                      color: ColorsConfig.colorBlack,
                                      size: 25,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dr. Anil Patel',
                                      style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 17.0,
                                          color: ColorsConfig.colorBlack,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Pyschiatry, counsellor',
                                      style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 15.0,
                                          color: ColorsConfig.colorGreyy,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '22 Jan 2021,6:00 PM',
                                      style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 12.0,
                                          color: ColorsConfig.colorBlack,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Dr.Anil Patel',
                                      style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 15.0,
                                          color: ColorsConfig.colorBlack,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Dr.Anil Patel',
                                      style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 12.0,
                                          color: ColorsConfig.colorBlack,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
            text: 'Doctor Notes'),
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
