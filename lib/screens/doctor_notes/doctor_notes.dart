import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class DoctorNotesScreen extends GetView<DoctorNotesController> {
  static const pageId = "/DoctorNotesScreen";

  const DoctorNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutWidget(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Column(
              children: [
                textConatiner('Notes'),
                const SizedBox(
                  height: 15,
                ),
                iconConatiner(ImagePath.iconFile,
                    () => Get.toNamed(DoctorNotesDetail.pageId)),
                const SizedBox(
                  height: 40,
                ),
                textConatiner('Medicine & Prescription'),
                const SizedBox(
                  height: 15,
                ),
                iconConatiner(ImagePath.iconPrescription,
                    () => Get.toNamed(PrescriptionScreen.pageId)),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        isAssessment: false,
        text: 'Doctor Notes',
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
          fontSize: 18.0,
          color: ColorsConfig.colorWhite,
        ),
      ),
    );
  }

  Widget iconConatiner(String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 8,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.1, horizontal: Get.width * 0.28),
          decoration: BoxDecoration(
            color: ColorsConfig.colorGreyy.withOpacity(0.4),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Image.asset(imagePath, fit: BoxFit.cover, height: 150),
        ),
      ),
    );
  }
}
