import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../model/model.dart';
import '../../util/common.dart';

final List<String> imgList = [
  ImagePath.doc1,
  ImagePath.onBoard1,
  ImagePath.onBoard2,
  ImagePath.onBoard3,
  ImagePath.onBoard4,
];
final List<String> hosImg = [
  ImagePath.hospital1,
  ImagePath.hospital1,
  ImagePath.hospital1,
  ImagePath.hospital1,
  ImagePath.hospital1,
];

class HomeScreen extends StatefulWidget {
  static const pageId = "/HomeScreen";

  const HomeScreen({Key? key, this.onDrawerClick}) : super(key: key);
  final VoidCallback? onDrawerClick;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final DashboardController dashboardController = Get.find();

  var _username = '';

  @override
  void initState() {
    super.initState();
    getProfileDetails();
  }

  getProfileDetails() async {
    var res = await Common.retrievePrefData(Common.strLoginRes);
    setState(() {
      _username =
          res.isNotEmpty ? jsonDecode(res)['PatientData']['patient_name'] : '';
    });
    print(_username);
  }

  late List<Widget> imageSliders = imgList
      .asMap()
      .entries
      .map((item) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsConfig.colorBlack,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
                child: Image.asset(
              item.value,
              fit: BoxFit.cover,
              width: Get.width * 0.7,
              height: Get.height,
            )),
          ))
      .toList();

  late List<Widget> imgData =
      hosImg.map((item) => PackagesWidget(item: item)).toList();

  late List<Widget> experts =
      expertImg.map((item) => RecommendedExperts(imgItem: item)).toList();
/*  late List<Widget> imageSliders = imgList
      .map((item) => Container(
    width: Get.width,
        decoration: BoxDecoration(
      border: Border.all(
        color: ColorsConfig.colorBlack,
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius:
      BorderRadius.circular(10.0),
      ),
        child: Row(
          children: [
            SizedBox(width: 20,),
            Image.asset(item, fit: BoxFit.cover, width: Get.width*0.7,height: Get.height,),
            Spacer(),
IconButton(onPressed: (){
  _controller.animateToPage(item);
}, icon: Icon(Icons.arrow_forward_ios,color: ColorsConfig.colorBlue,))
          ],
        ),
      ))
      .toList();*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorBlue,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: ColorsConfig.colorBlue,
        leading: Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 0, 5),
            child: Image.asset(
              ImagePath.myndroLogoW,
            )),
        leadingWidth: 130,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
            child: ClipOval(
              child: Material(
                color: ColorsConfig.colorWhite,
                child: GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                      height: 52,
                      width: 35,
                      child: Icon(
                        Icons.notifications,
                        color: ColorsConfig.colorBlue,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
      body: GestureDetector(onTap: () {
        Get.focusScope!.unfocus();
      }, child: Obx(
        () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.menu,
                          color: ColorsConfig.colorWhite, size: 35),
                      onPressed: widget.onDrawerClick),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final list = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(
                              allTextList: dashboardController.allDoctors,
                              selectedUserList:
                                  dashboardController.selectedUserList,
                            ),
                          ),
                        );
                        if (list != null) {
                          setState(() {
                            dashboardController.selectedUserList =
                                List.from(list);
                          });
                        }
                      },
                      child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: ColorsConfig.colorWhite,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                'Search something ...',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color:
                                      ColorsConfig.colorBlue.withOpacity(0.8),
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.search,
                                color: ColorsConfig.colorBlue,
                              ),
                            ],
                          )
                          /*TextField(
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 15.0,
                            color: ColorsConfig.colorBlue.withOpacity(0.8),
                          ),
                          onChanged: (_) {},
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            fillColor: ColorsConfig.colorWhite,
                            filled: true,
                            suffixIcon: const Icon(
                              Icons.search,
                              color: ColorsConfig.colorBlue,
                            ),
                            hintText: 'Search something ...',
                            hintStyle: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: ColorsConfig.colorBlue.withOpacity(0.8),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                          ))*/

                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                // height: Get.height,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: ColorsConfig.colorBlue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Welcome!',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConfig.colorWhite,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Hello, $_username',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConfig.colorWhite,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'How can we help you?',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConfig.colorWhite,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.1,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: const BoxDecoration(
                              color: ColorsConfig.colorWhite,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              children: [
                                /*Card(
                                  elevation: 5,
                                  color: ColorsConfig.colorWhite,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: ColorsConfig.colorBlue, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 0, 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                padding: const EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        ColorsConfig.colorBlack,
                                                    style: BorderStyle.solid,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8.0),
                                                ),
                                                child: Text(
                                                  'Wallet',
                                                  style: TextStyle(
                                                    fontFamily: AppTextStyle
                                                        .microsoftJhengHei,
                                                    fontSize: 25.0,
                                                    color:
                                                        ColorsConfig.colorBlack,
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              'Myndro Balance',
                                              style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 20.0,
                                                  color: ColorsConfig.colorBlue,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              '100',
                                              style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 20.0,
                                                  color: ColorsConfig.colorBlack,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                  color: ColorsConfig.colorBlue,
                                                  border: Border.all(
                                                    color: ColorsConfig.colorBlue,
                                                    style: BorderStyle.solid,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8.0),
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.add,
                                                      color:
                                                          ColorsConfig.colorWhite,
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Add Money',
                                                      style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 18.0,
                                                        color: ColorsConfig
                                                            .colorWhite,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 20, 10, 20),
                                          child: Image.asset(
                                            ImagePath.addMoneyImg,
                                            height: Get.height * 0.2,
                                            width: Get.width * 0.36,
                                            fit: BoxFit.fill,
                                          )),
                                    ],
                                  )),*/
                                SizedBox(
                                  height: Get.height * 0.2,
                                ),
                                Column(children: [
                                  CarouselSlider(
                                    items: imageSliders,
                                    carouselController: _controller,
                                    options: CarouselOptions(
                                        enableInfiniteScroll: false,
                                        viewportFraction: 1,
                                        autoPlay: false,
                                        enlargeCenterPage: false,
                                        aspectRatio: 2.0,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _current = index;
                                          });
                                        }),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        imgList.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controller
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
                                                      : ColorsConfig.colorBlue)
                                                  .withOpacity(
                                                      _current == entry.key
                                                          ? 0.99
                                                          : 0.6)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ]),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: Get.width,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorsConfig.colorBlack,
                                      style: BorderStyle.solid,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Upcoming Appointment',
                                          style: TextStyle(
                                            fontFamily:
                                                AppTextStyle.microsoftJhengHei,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: ColorsConfig.colorBlack,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 100,
                                        child: ListView.separated(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          itemCount: 2,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () => Get.toNamed(
                                                  UpcomingAppointments.pageId),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .account_circle_rounded,
                                                      size: 38,
                                                      color: ColorsConfig
                                                          .colorBlue),
                                                  Column(
                                                    children: [
                                                      Text('Dr. Anil Patel',
                                                          style: TextStyle(
                                                            fontFamily: AppTextStyle
                                                                .microsoftJhengHei,
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: ColorsConfig
                                                                .colorBlack,
                                                          )),
                                                      Text('Psychiatrist',
                                                          style: TextStyle(
                                                            fontFamily: AppTextStyle
                                                                .microsoftJhengHei,
                                                            fontSize: 13.0,
                                                            color: ColorsConfig
                                                                .colorGreyy,
                                                          )),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text('14th july 2022',
                                                          style: TextStyle(
                                                            fontFamily: AppTextStyle
                                                                .microsoftJhengHei,
                                                            fontSize: 15.0,
                                                            color: ColorsConfig
                                                                .colorBlack,
                                                          )),
                                                      Text('01:10',
                                                          style: TextStyle(
                                                            fontFamily: AppTextStyle
                                                                .microsoftJhengHei,
                                                            fontSize: 15.0,
                                                            color: ColorsConfig
                                                                .colorBlack,
                                                          )),
                                                    ],
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    child: const Icon(
                                                        Icons.videocam,
                                                        size: 25,
                                                        color: ColorsConfig
                                                            .colorWhite),
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: ColorsConfig
                                                                .colorBlue),
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
                                const SizedBox(
                                  height: 15,
                                ),

                                /* GestureDetector(
                                onTap: () =>
                                    Get.toNamed(ExpertDetailScreen.pageId),
                                child: Container(
                                  width: Get.width,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorsConfig.colorBlack,
                                      style: BorderStyle.solid,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Recommended  Experts',
                                        style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConfig.colorBlack,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      ColorsConfig.colorBlack,
                                                  style: BorderStyle.solid,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                ImagePath.girl,
                                                fit: BoxFit.cover,
                                                // height: 80,
                                                width: Get.width * 0.2,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Dr.Sophia',
                                                  style: TextStyle(
                                                    fontFamily: AppTextStyle
                                                        .microsoftJhengHei,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        ColorsConfig.colorBlack,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Psychologist',
                                                  style: TextStyle(
                                                    fontFamily: AppTextStyle
                                                        .microsoftJhengHei,
                                                    fontSize: 15.0,
                                                    color:
                                                        ColorsConfig.colorBlack,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                RatingBar.builder(
                                                  itemSize: 22,
                                                  initialRating: 3,
                                                  minRating: 0,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  // itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color:
                                                        ColorsConfig.colorBlue,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Common.iconContainer(
                                                Icons.phone_in_talk_rounded,
                                                'Audio call',
                                                isPriceVisible: true,
                                                subText: '\u{20B9}${' 400'}'),
                                          ),
                                          Expanded(
                                            child: Common.iconContainer(
                                                Icons.videocam, 'Video call',
                                                isPriceVisible: true,
                                                subText: '\u{20B9}${' 500'}'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ), */
                                Column(children: [
                                  CarouselSlider(
                                    items: experts,
                                    carouselController: _controller,
                                    options: CarouselOptions(
                                        enableInfiniteScroll: false,
                                        viewportFraction: 1,
                                        aspectRatio: 1.7,
                                        autoPlay: false,
                                        enlargeCenterPage: false,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _current = index;
                                          });
                                        }),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        hosImg.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controller
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
                                                      : ColorsConfig.colorBlue)
                                                  .withOpacity(
                                                      _current == entry.key
                                                          ? 0.99
                                                          : 0.6)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ]),
                                const SizedBox(
                                  height: 25,
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
                                    children:
                                        hosImg.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controller
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
                                                      : ColorsConfig.colorBlue)
                                                  .withOpacity(
                                                      _current == entry.key
                                                          ? 0.99
                                                          : 0.6)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ]),
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        // left: 0,
                        top: 95,
                        child: Container(
                          width: Get.width,
                          padding: const EdgeInsets.only(left: 17, right: 17),
                          child: Card(
                              elevation: 5,
                              color: ColorsConfig.colorWhite,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: ColorsConfig.colorBlue, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 0, 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      ColorsConfig.colorBlack,
                                                  style: BorderStyle.solid,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Text(
                                                'Wallet',
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 25.0,
                                                  color:
                                                      ColorsConfig.colorBlack,
                                                ),
                                              )),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Myndro Balance',
                                            style: TextStyle(
                                                fontFamily: AppTextStyle
                                                    .microsoftJhengHei,
                                                fontSize: 20.0,
                                                color: ColorsConfig.colorBlue,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            dashboardController
                                                .walletAmount.value,
                                            /*   (num.parse(dashboardController
                                                        .walletAmount.value)
                                                    .toStringAsFixed(3))
                                                .toString(), */
                                            maxLines: 3,
                                            style: TextStyle(
                                                fontFamily: AppTextStyle
                                                    .microsoftJhengHei,
                                                fontSize: 20.0,
                                                color: ColorsConfig.colorBlack,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // Get.toNamed(WalletScreen.pageId);
                                              dashboardController
                                                  .displayDialog(context);
                                            },
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                  color: ColorsConfig.colorBlue,
                                                  border: Border.all(
                                                    color:
                                                        ColorsConfig.colorBlue,
                                                    style: BorderStyle.solid,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.add,
                                                      color: ColorsConfig
                                                          .colorWhite,
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Add Money',
                                                      style: TextStyle(
                                                        fontFamily: AppTextStyle
                                                            .microsoftJhengHei,
                                                        fontSize: 18.0,
                                                        color: ColorsConfig
                                                            .colorWhite,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      ImagePath.addMoneyImg,
                                      height: Get.height * 0.2,
                                      width: Get.width * 0.36,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      )),
    );
  }
}
