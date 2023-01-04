import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class ExpertPackagesList extends GetView<ExpertPackagesController> {
  static const pageId = "/ExpertPackagesList";

  const ExpertPackagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => ExpertLayout(
        leadingIcon: Icons.arrow_back,
        onDrawerClick: () {
          Get.back();
        },
        text: 'My Packages',
        body: GestureDetector(
          onTap: () {
            Get.focusScope!.unfocus();
          },
          child: controller.isLoading.value
              ? const MyndroLoader()
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return dataContainer(
                        controller.packList[index].caseNo ?? '',
                        Common.formatLockerDate(
                          controller.packList[index].createdDate ?? '',
                        ),
                        controller.packList[index].packageStatus ?? '',
                        () => controller.viewPackageDetails(
                              context,
                              controller.packList[index].packageTitle ?? '',
                              controller.packList[index].packageDetails ?? '',
                              controller.packList[index].noOfSession ?? '',
                              controller.packList[index].sessionDuration ?? '',
                              controller.packList[index].packagePrice ?? '',
                            ));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: ColorsConfig.colorGreyy,
                    );
                  },
                  itemCount: controller.packList.length),
        ),
      ),
    ));
  }

  Widget dataContainer(
    String caseNo,
    String date,
    String packStatus,
    VoidCallback onView,
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
        packStatus == '0'
            ? Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Under Review',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 10.0,
                      color: ColorsConfig.colorWhite,
                      fontWeight: FontWeight.bold),
                ),
              )
            : packStatus == '1'
                ? Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Approved',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 10.0,
                          color: ColorsConfig.colorWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Rejected',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 10.0,
                          color: ColorsConfig.colorWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onView,
          child: Container(
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
        ),
      ],
    );
  }
}
