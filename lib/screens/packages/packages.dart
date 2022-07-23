import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';

class PackagesScreen extends GetView<PackagesController> {
  static const pageId = "/PackagesScreen";

  const PackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
          body: LayoutWidget(
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            itemBuilder: (context, index) {
              return packagesContainer(
                  'Hospital Happiness Program',
                  'Frontline employees in hospitals have worked lengthy hours without rest during the COVID-19 outbreak. They continued to work despite.',
                  ImagePath.hospital1);
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: ColorsConfig.colorGreyy,
                ),
              );
            },
            itemCount: 5),
        isAssessment: false,
        text: 'Packages',
      )),
    );
  }
}

Widget packagesContainer(String title, String text, String imgPath) {
  return Container(
    width: Get.width,
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 20.0,
              color: ColorsConfig.colorBlue,
              fontWeight: FontWeight.bold),
          maxLines: 6,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 15.0,
                  color: ColorsConfig.colorBlack,
                ),
                // maxLines: 6,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
