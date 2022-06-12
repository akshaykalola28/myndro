import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';

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

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  late List<Widget> imageSliders = imgList
      .asMap()
      .entries
      .map((item) => Container(
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

  late List<Widget> imgData = hosImg
      .map((item) => Container(
            width: Get.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsConfig.colorBlack,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hospital Happiness Program',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 20.0,
                      color: ColorsConfig.colorBlack,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: Get.width * 0.4,
                        child: Text(
                          'Frontline employees in hospitals have worked lengthy hours without rest during the COVID-19 outbreak. They continued to work despite.',
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 13.0,
                            color: ColorsConfig.colorBlack,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                          width: Get.width * 0.4,
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ))
      .toList();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 15.0,
                  color: ColorsConfig.colorBlue.withOpacity(0.8),
                ),
                onChanged: (_) {},
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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
                )),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'Hello, Josheff!',
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
                          borderRadius: const BorderRadius.only(
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
                              height: Get.height * 0.17,
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
                                    // aspectRatio: 1.0,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    }),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: imgList.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () =>
                                        _controller.animateToPage(entry.key),
                                    child: Container(
                                      width: 12.0,
                                      height: 12.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : ColorsConfig.colorBlue)
                                              .withOpacity(_current == entry.key
                                                  ? 0.99
                                                  : 0.6)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ]),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 6),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Table(
                                    border: TableBorder.all(
                                        color: Colors.transparent),
                                    children: [
                                      TableRow(
                                          decoration: BoxDecoration(
                                            color: ColorsConfig.colorBlue,
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text('Name',
                                                    style: TextStyle(
                                                      fontFamily: AppTextStyle
                                                          .microsoftJhengHei,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ColorsConfig
                                                          .colorWhite,
                                                    )),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text('Timing',
                                                    style: TextStyle(
                                                      fontFamily: AppTextStyle
                                                          .microsoftJhengHei,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ColorsConfig
                                                          .colorWhite,
                                                    )),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                  child: Image.asset(
                                                ImagePath.iconList,
                                                height: 20,
                                                width: 20,
                                              )),
                                            ),
                                          ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person_sharp,
                                                color: ColorsConfig.colorBlue,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Center(
                                                child: Text('Suryaraj',
                                                    style: TextStyle(
                                                      fontFamily: AppTextStyle
                                                          .microsoftJhengHei,
                                                      fontSize: 15.0,
                                                      color: ColorsConfig
                                                          .colorBlack,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Center(
                                            child: Text('01:10',
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 15.0,
                                                  color:
                                                      ColorsConfig.colorBlack,
                                                )),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 5),
                                            decoration: BoxDecoration(
                                              color: ColorsConfig.colorBlue,
                                              border: Border.all(
                                                color: ColorsConfig.colorBlue,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                            ),
                                            child: Text('View',
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 12.0,
                                                  color:
                                                      ColorsConfig.colorWhite,
                                                )),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person_sharp,
                                                color: ColorsConfig.colorBlue,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Center(
                                                child: Text('Payal',
                                                    style: TextStyle(
                                                      fontFamily: AppTextStyle
                                                          .microsoftJhengHei,
                                                      fontSize: 15.0,
                                                      color: ColorsConfig
                                                          .colorBlack,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Center(
                                            child: Text('01:10',
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 15.0,
                                                  color:
                                                      ColorsConfig.colorBlack,
                                                )),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 5),
                                            decoration: BoxDecoration(
                                              color: ColorsConfig.colorBlue,
                                              border: Border.all(
                                                color: ColorsConfig.colorBlue,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                            ),
                                            child: Text('View',
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 12.0,
                                                  color:
                                                      ColorsConfig.colorWhite,
                                                )),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Similar Experts',
                                    style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorsConfig.colorBlack,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImagePath.girl,
                                        fit: BoxFit.contain,
                                        height: 80,
                                        width: 80,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Dr.Sophia',
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 18.0,
                                                  color:
                                                      ColorsConfig.colorBlack,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                '4.9 Review',
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 18.0,
                                                  color:
                                                      ColorsConfig.colorBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Psychologist',
                                                style: TextStyle(
                                                  fontFamily: AppTextStyle
                                                      .microsoftJhengHei,
                                                  fontSize: 18.0,
                                                  color:
                                                      ColorsConfig.colorBlack,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 28,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: ColorsConfig.colorBlue,
                                                size: 18,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: ColorsConfig.colorBlue,
                                                size: 18,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: ColorsConfig.colorBlue,
                                                size: 18,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: ColorsConfig.colorBlue,
                                                size: 18,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: ColorsConfig.colorBlue,
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Experiance :- 5 Years',
                                            style: TextStyle(
                                              fontFamily: AppTextStyle
                                                  .microsoftJhengHei,
                                              fontSize: 18.0,
                                              color: ColorsConfig.colorBlack,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
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
                                children: hosImg.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () =>
                                        _controller.animateToPage(entry.key),
                                    child: Container(
                                      width: 12.0,
                                      height: 12.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : ColorsConfig.colorBlue)
                                              .withOpacity(_current == entry.key
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
                      height: 215,
                      width: Get.width,
                      padding: EdgeInsets.only(left: 17, right: 17),
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
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 0, 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ColorsConfig.colorBlack,
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          'Wallet',
                                          style: TextStyle(
                                            fontFamily:
                                                AppTextStyle.microsoftJhengHei,
                                            fontSize: 25.0,
                                            color: ColorsConfig.colorBlack,
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Myndro Balance',
                                      style: TextStyle(
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
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
                                          fontFamily:
                                              AppTextStyle.microsoftJhengHei,
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
                                              color: ColorsConfig.colorWhite,
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
                                                color: ColorsConfig.colorWhite,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Image.asset(
                                    ImagePath.addMoneyImg,
                                    height: Get.height * 0.2,
                                    width: Get.width * 0.36,
                                    fit: BoxFit.fill,
                                  )),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
