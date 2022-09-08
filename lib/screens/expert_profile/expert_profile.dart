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
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                  child: profileDataContainer(context),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                  child: TabBar(
                      controller: controller.tabController,
                      isScrollable: true,
                      indicatorColor: ColorsConfig.colorBlue,
                      labelColor: ColorsConfig.colorBlue,
                      unselectedLabelColor: Colors.black,
                      tabs: controller.myTabs),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: controller.tabController,
            children: [
              Column(
                children: const [
                  Text('data'),
                ],
              ),
              const Text('data'),
              const Text('data'),
              const Text('data'),
            ],
          ),

          /* child: Column(
              children: [
                profileDataContainer(),
                const SizedBox(
                  height: 15,
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
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: controller.myTabs.map((Tab tab) {
                      final String label = tab.text!;
                      return Center(
                        child: Text(
                          'This is the $label tab',
                          style: const TextStyle(fontSize: 36),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            )*/
        ),
      ),
    );
  }

  Widget profileDataContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr.Anil Patel',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: ColorsConfig.colorBlack,
                      ),
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorsConfig.colorWhite,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorsConfig.colorGreyy,
                        ),
                      ),
                      child: Text(
                        'cdcdcdcd',
                        maxLines: 3,
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (TapDownDetails details) {
                    controller.showPopupMenu(context, details.globalPosition);
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
          const SizedBox(
            height: 12,
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
          const SizedBox(
            height: 12,
          ),
          Text(
            'Bio',
            style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 15.0,
                color: ColorsConfig.colorBlack,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorsConfig.colorWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorsConfig.colorGreyy,
              ),
            ),
            child: Text(
              'cdcdcdcd',
              maxLines: 3,
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 15.0,
                color: ColorsConfig.colorBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
