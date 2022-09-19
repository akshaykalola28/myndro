import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class ExpertProfile extends GetView<ExpertProfileController> {
  static const pageId = "/ExpertProfile";

  ExpertProfile({Key? key}) : super(key: key);
  final GlobalKey menuKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
        leadingIcon: Icons.arrow_back,
        onDrawerClick: () {
          Get.back();
        },
        text: 'Profile',
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Column(
            children: [
              profileDataContainer(context),
              const SizedBox(
                height: 5,
              ),
              TabBar(
                  controller: controller.tabController,
                  isScrollable: true,
                  indicatorColor: ColorsConfig.colorBlue,
                  labelColor: ColorsConfig.colorBlue,
                  unselectedLabelColor: Colors.black,
                  tabs: controller.myTabs),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<ExpertProfileController>(
                  builder: (controller) => Container(
                        child: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bio',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Dr. Khandelwal pursued his MBBS from the prestigious Institute - Grant Medical College & Sir J.J. Group of Hospitals, Mumbai. Later he completed MD Psychiatry from renowned Institute - B.J. Medical College, Pune. Since than he worked at various hospitals in Mumbai and from past 4 years is heading the Psychiatry Department in a 550 bedded hospital at Surat. He being a trained professional both in Psychological Medicine and REBT Counselling aims at bringing a holistic approach towards treating patients with mental illness. He uses a blend of medications and counseling in his professional practi',
                                maxLines: 5,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Area Of Expertise',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Psychosexual Problems',
                                maxLines: 5,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Specialties',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Psychiatry',
                                maxLines: 5,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Education',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'MBBS - Maharashtra University Of  Health Sciences - 2011 Psychiatry - MUHS - 2015',
                                maxLines: 5,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Experience',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '2015 - 2016 Speciality Medical Officer at Lokmanya Tilak Municipal General Hospital',
                                maxLines: 5,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Treatment Approaches',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '2005 - 2011 MBBS',
                                maxLines: 5,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Training & Certification',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Integrative   \nCognitive Behavioural Approach',
                                maxLines: 5,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'License Registration',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '11-40795 - 2011',
                                maxLines: 5,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'User Feedback ',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: Get.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                decoration: BoxDecoration(
                                    color: ColorsConfig.colorGrey,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ms. Mansi Mehta',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: ColorsConfig.colorBlack,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                                        maxLines: 5,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontWeight: FontWeight.bold,
                                          color: ColorsConfig.colorBlue,
                                        ),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(ImagePath.docspace,
                                  fit: BoxFit.cover),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: Get.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                decoration: BoxDecoration(
                                    color: ColorsConfig.colorGrey,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'What is Mental Health ?',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: ColorsConfig.colorBlack,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, centuries, but also the leap into electronic typesetting, Continue Readi.",
                                        maxLines: 5,
                                        style: TextStyle(
                                          // fontSize: 15.0,
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          color: ColorsConfig.colorBlack,
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'User Questions',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: Get.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                decoration: BoxDecoration(
                                    color: ColorsConfig.colorGrey,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ms. Mansi Mehta',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: ColorsConfig.colorBlack,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'What is Loream Lpsum?',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          color: ColorsConfig.colorBlack,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                                        maxLines: 5,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontWeight: FontWeight.bold,
                                          color: ColorsConfig.colorBlue,
                                        ),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ][controller.tabController!.index],
                      ))
            ],
          ),
        ),
      ),
    );
  }

  Widget profileDataContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
      decoration: BoxDecoration(
          color: ColorsConfig.colorGrey,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsConfig.colorBlack,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    ImagePath.girl,
                    fit: BoxFit.cover,
                    // height: 80,
                    width: Get.width * 0.3,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Dr.Anil Patel',
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: ColorsConfig.colorBlack,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTapDown: (TapDownDetails details) {
                              controller.showPopupMenu(
                                  context, details.globalPosition);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: ColorsConfig.colorGrey,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                              child: Text(
                                'edit',
                                maxLines: 3,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color: ColorsConfig.colorBlack,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'psychiatrist',
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorGreyy.withOpacity(0.8),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'specialities',
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorBlack,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'psychiatrist',
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorGreyy.withOpacity(0.8),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Common.iconContainer(
                    Icons.phone_in_talk_rounded, 'Audio call',
                    isPriceVisible: true, subText: '\u{20B9}${' 400'}'),
              ),
              Expanded(
                child: Common.iconContainer(Icons.videocam, 'Video call',
                    isPriceVisible: true, subText: '\u{20B9}${' 500'}'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
