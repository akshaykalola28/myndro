import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/widgets/layout_widget.dart';
import '../../constant/constant.dart';
import '../../controller/controller.dart';

class UpcomingAppointments extends GetView<HomeController> {
  static const pageId = "/UpcomingAppointments";

  const UpcomingAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
        body: LayoutWidget(
            body: Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Appointment',
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: ColorsConfig.colorBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: 15,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(UpcomingAppointments.pageId),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.account_circle_rounded,
                                  size: 38, color: ColorsConfig.colorBlue),
                              Column(
                                children: [
                                  Text('Dr. Anil Patel',
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsConfig.colorBlack,
                                      )),
                                  Text('Psychiatrist',
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 13.0,
                                        color: ColorsConfig.colorGreyy,
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('14th july 2022',
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 15.0,
                                        color: ColorsConfig.colorBlack,
                                      )),
                                  Text('01:10',
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 15.0,
                                        color: ColorsConfig.colorBlack,
                                      )),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: const Icon(Icons.videocam,
                                    size: 20, color: ColorsConfig.colorWhite),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsConfig.colorBlue),
                              ),
                              Center(
                                child: Text('package',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsConfig.colorBlack,
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: ColorsConfig.colorBlack,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            isAssessment: false,
            text: 'Appointments'),
      ),
    );
  }
}
