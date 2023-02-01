import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../services/services.dart';
import '../screens.dart';

class PackagesScreen extends GetView<PackagesController> {
  static const pageId = "/PackagesScreen";

  const PackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Obx(() => Scaffold(
              body: LayoutWidget(
            body: controller.isLoading.value
                ? const MyndroLoader()
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    itemBuilder: (context, index) {
                      return packagesDataContainer(
                        controller.packagesList[index].packageName ?? '',
                        controller.packagesList[index].packageDesc ?? '',
                        controller.packagesList[index].packageImage ?? '',
                        controller.packagesList[index].packageNoSession ?? '',
                        controller.packagesList[index].packagePrice ?? '',
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: ColorsConfig.colorGreyy,
                        ),
                      );
                    },
                    itemCount: controller.packagesList.length),
            isAssessment: false,
            text: 'Packages',
          ))),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      color: ColorsConfig.colorBlack,
                    ),
                    // maxLines: 6,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Know More >',
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      color: ColorsConfig.colorBlue,
                    ),
                    // maxLines: 6,
                  ),
                ],
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

Widget packagesDataContainer(String title, String description, String imgPath,
    String noOfSession, String price) {
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
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 16.0,
                      color: ColorsConfig.colorBlack,
                    ),
                    // maxLines: 6,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '$noOfSession Sessions',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                        fontWeight: FontWeight.bold),
                    // maxLines: 6,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\u{20B9} $price /-',
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 16.0,
                      color: ColorsConfig.colorBlack,
                    ),
                    // maxLines: 6,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  loginButtonWidget('Book Now', () {}),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Image.network(
                '${Apis.webViewUrl}$imgPath',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
