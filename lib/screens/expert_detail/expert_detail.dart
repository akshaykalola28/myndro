import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../widgets/widgets.dart';

class ExpertDetailScreen extends StatefulWidget {
  static const pageId = "/ExpertDetailScreen";

  const ExpertDetailScreen({Key? key}) : super(key: key);

  @override
  State<ExpertDetailScreen> createState() => _ExpertDetailScreenState();
}

class _ExpertDetailScreenState extends State<ExpertDetailScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  ScrollController controller = ScrollController();
  late List<Widget> imgData =
      hosImg.map((item) => PackagesWidget(item: item)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: LayoutWidget(
          text: 'Appointment',
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const ExpertDetailContainer(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                        color: ColorsConfig.colorBlack, thickness: 0.5),
                  ),
                  /*  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Appointment Request',
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorGreyy,
                          fontWeight: FontWeight.w600),
                    ),
                  ),*/
                  const SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    CarouselSlider(
                      items: imgData,
                      carouselController: _controller,
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                          autoPlay: false,
                          enlargeCenterPage: false,
                          // aspectRatio: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: hosImg.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : ColorsConfig.colorBlue)
                                    .withOpacity(
                                        _current == entry.key ? 0.99 : 0.6)),
                          ),
                        );
                      }).toList(),
                    ),
                  ]),
                  /* SizedBox(
                    height: Get.height * 0.3,
                    child: Card(
                      color: ColorsConfig.colorLightGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: DraggableScrollbar(
                        controller: controller,
                        child: ListView.builder(
                          controller: controller,
                          itemCount: 10,
                          // itemExtent: 100.0,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: ColorsConfig.colorBlue,
                                            border: Border.all(
                                                color: ColorsConfig.colorBlue),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50))),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 10,
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  ImagePath.humanPhone,
                                                ),
                                                fit: BoxFit.fill,
                                                alignment:
                                                    Alignment.bottomCenter,
                                              ),
                                              color: ColorsConfig.colorBlue,
                                              border: Border.all(
                                                  color:
                                                      ColorsConfig.colorBlue),
                                              borderRadius: const BorderRadius
                                                      .all(
                                                  Radius.circular(50))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Vandana Kapoor',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConfig.colorGreyy,
                                        ),
                                      ),
                                      Text(
                                        'data',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w400,
                                          color: ColorsConfig.colorGreyy,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 3, 12, 3),
                                      decoration: BoxDecoration(
                                          color: ColorsConfig.colorBlue
                                              .withOpacity(0.2),
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Text(
                                        'Accept',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConfig.colorBlue,
                                        ),
                                      )),
                                ],
                              ),
                            );
                          },
                        ),
                        heightScrollThumb: 48.0,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: ColorsConfig.colorGreyy,
                        scrollThumbBuilder: (
                          Color backgroundColor,
                          Animation<double> thumbAnimation,
                          Animation<double> labelAnimation,
                          double height, {
                          Text? labelText,
                          BoxConstraints? labelConstraints,
                        }) {
                          return Container(
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                border: Border.all(color: Colors.transparent),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25))),
                            height: height,
                            width: 8.0,
                          );
                        },
                      ),
                    ),
                  ),*/
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
