import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class ExpertPackagesList extends GetView<ExpertPackagesController> {
  static const pageId = "/ExpertPackagesList";

  const ExpertPackagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
        leadingIcon: Icons.arrow_back,
        onDrawerClick: () {
          Get.back();
        },
        text: 'My Packages',
        body: GestureDetector(
          onTap: () {
            Get.focusScope!.unfocus();
          },
          child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return dataContainer('M oo1', '16/4/2010', 'approved');
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                  color: ColorsConfig.colorGreyy,
                );
              },
              itemCount: 5),
        ),
      ),
    );
  }

  Widget dataContainer(
    String caseNo,
    String date,
    String packageInfo,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.file_copy_rounded,
          size: 32,
          color: ColorsConfig.colorGreyy,
        ),
        Column(
          children: [
            Text(
              'Case No.',
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: ColorsConfig.colorGreyy,
              ),
            ),
            Text(
              caseNo,
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                color: ColorsConfig.colorGreyy,
              ),
            ),
          ],
        ),
        Text(
          date,
          style: TextStyle(
            fontFamily: AppTextStyle.microsoftJhengHei,
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
            color: ColorsConfig.colorGreyy,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            packageInfo,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 10.0,
                color: ColorsConfig.colorWhite,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: ColorsConfig.colorBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            'view',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 10.0,
                color: ColorsConfig.colorWhite,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
