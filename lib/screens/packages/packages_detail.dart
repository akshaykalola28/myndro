import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class PackagesDetailScreen extends GetView<PackagesController> {
  static const pageId = "/PackagesDetailScreen";

  PackagesDetailScreen({Key? key}) : super(key: key);
  late List<Widget> imgData = controller.sliderPages
      .map((item) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Image.asset(
                    item.imageAsset,
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 2,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: ColorsConfig.colorGreyy,
                  ),
                ),
              ),
            ],
          )))
      .toList();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsConfig.colorBlue,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorsConfig.colorWhite,
                  size: 30,
                )),
          ),
          body: Obx(
            () => Column(
              children: [
                ClipPath(
                  clipper: CurvedBottomClipper(),
                  child: Container(
                    color: ColorsConfig.colorBlue,
                    height: Get.height * 0.2,
                    width: Get.width,
                    child: SafeArea(
                      child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: Get.height * 0.4,
                              width: Get.width * 0.4,
                              child: Image.asset(
                                ImagePath.myndroWhite,
                                fit: BoxFit.contain,
                              ))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "HOSPITAL HAPPINESS PROGRAM",
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsConfig.colorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Your staff takes care of your patients,\nwe take care of your staff.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 18.0,
                                    color: ColorsConfig.colorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          height: 200.0,
                          width: Get.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                    Colors.blueAccent.withOpacity(0.6),
                                    BlendMode.modulate,
                                  ),
                                  image: AssetImage(
                                    ImagePath.hhp1,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          width: Get.width,
                          color: Colors.blueAccent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Our Service',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w900,
                                  color: ColorsConfig.colorWhite,
                                ),
                              ),
                              // 003784
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Frontline employees in hospitals have worked for hours without rest during the COVID-19 outbreak. They continued to work despite the added worry of contracting COVID-19 and perhaps infecting their families. Past some years in the lives of frontline workers have left an indelible mark on their minds, potentially affecting their mental health and professional lives. To deal with all of this, and to impart healthy coping mechanisms to these warriors, Myndro has come up with a programme called Hospital Happiness Program (HHP)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color: ColorsConfig.colorWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: Get.width,
                          color: ColorsConfig.colorDarkBlue,
                          child: Center(
                            child: Text(
                              'Our Program Features',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 23.0,
                                fontWeight: FontWeight.w900,
                                color: ColorsConfig.colorWhite,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.blueAccent,
                          padding: const EdgeInsets.all(12),
                          width: Get.width,
                          child: Column(
                            children: [
                              Column(children: [
                                CarouselSlider(
                                  items: imgData,
                                  carouselController:
                                      controller.carouselController,
                                  options: CarouselOptions(
                                      enableInfiniteScroll: false,
                                      height: Get.height * 0.2,
                                      viewportFraction: 0.3,
                                      autoPlay: false,
                                      enlargeCenterPage: true,
                                      // aspectRatio: 1.0,
                                      onPageChanged: (index, reason) {
                                        controller.currentIndex.value = index;
                                      }),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: controller.sliderPages
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    return GestureDetector(
                                      onTap: () => controller.carouselController
                                          .animateToPage(entry.key),
                                      child: Container(
                                        width: 12.0,
                                        height: 12.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : ColorsConfig.colorWhite)
                                                .withOpacity(controller
                                                            .currentIndex
                                                            .value ==
                                                        entry.key
                                                    ? 0.99
                                                    : 0.6)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ]),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  Get.toNamed(PackagesFormScreen.pageId);
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: ColorsConfig.colorDarkBlue,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Text(
                                      'Connect Now',
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w900,
                                        color: ColorsConfig.colorWhite,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Why Choose HHP?',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              planList(
                                  controller.dataList[0].imageAsset,
                                  controller.dataList[0].name,
                                  Colors.blueAccent),
                              SizedBox(
                                height: 8,
                              ),
                              planList(
                                  controller.dataList[1].imageAsset,
                                  controller.dataList[1].name,
                                  ColorsConfig.colorDarkBlue),
                              SizedBox(
                                height: 8,
                              ),
                              planList(
                                  controller.dataList[2].imageAsset,
                                  controller.dataList[2].name,
                                  Colors.blueAccent),
                              SizedBox(
                                height: 8,
                              ),
                              planList(
                                  controller.dataList[3].imageAsset,
                                  controller.dataList[3].name,
                                  Colors.blueAccent),
                              SizedBox(
                                height: 8,
                              ),
                              planList(
                                  controller.dataList[4].imageAsset,
                                  controller.dataList[4].name,
                                  ColorsConfig.colorDarkBlue),
                              SizedBox(
                                height: 8,
                              ),
                              planList(
                                  controller.dataList[5].imageAsset,
                                  controller.dataList[5].name,
                                  Colors.blueAccent),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text(
                                    'It’s our chance to appreciate the frontline warriors for their service to the nation and its people.',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsConfig.colorWhite,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: ColorsConfig.colorDarkBlue,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Text(
                                        'Know More',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w900,
                                          color: ColorsConfig.colorWhite,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          height: 200.0,
                          width: Get.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                    Colors.blueAccent.withOpacity(0.6),
                                    BlendMode.modulate,
                                  ),
                                  image: AssetImage(
                                    ImagePath.hhp2,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget planList(String title, String subTitle, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 16.0,
              fontWeight: FontWeight.w900,
              color: ColorsConfig.colorWhite,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 13.0,
              color: ColorsConfig.colorWhite,
            ),
          ),
        ],
      ),
    );
  }
}
