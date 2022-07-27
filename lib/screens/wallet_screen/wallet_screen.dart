import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

// class WalletScreen extends StatefulWidget {
//   const WalletScreen({Key? key}) : super(key: key);
//   static const pageId = "/WalletScreen";

//   @override
//   State<StatefulWidget> createState() {
//   return
//   }
// }

class WalletScreen extends StatefulWidget {
  static const pageId = "/WalletScreen";
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  final WalletController controller = WalletController();
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Monthly'),
    const Tab(text: 'Weekly'),
    const Tab(text: 'Today'),
  ];
  TabController? tabController;

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(handleTabSelection);
    super.initState();
  }

  handleTabSelection() {
    if (tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: LayoutWidget(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            ColorsConfig.colorGreen,
                            ColorsConfig.colorBlue,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 1.0],
                          tileMode: TileMode.decal),
                      color: ColorsConfig.colorGreen,
                      border: Border.all(
                        color: Colors.transparent,
                        style: BorderStyle.solid,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Wallet Balance',
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 25.0,
                            color: ColorsConfig.colorWhite,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\u{20B9}${' 305'}',
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 35.0,
                            color: ColorsConfig.colorWhite,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              // margin: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorsConfig.colorWhite,
                                border: Border.all(
                                  color: ColorsConfig.colorSkyBlue,
                                  style: BorderStyle.solid,
                                  width: 3.0,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '\u{20B9}',
                                  style: TextStyle(
                                    // height: 1.0,
                                    // letterSpacing: 1,
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 50.0,
                                    color: ColorsConfig.colorBlue,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 135.0,
                              top: -2.0,
                              child: Icon(
                                Icons.add_circle,
                                color: ColorsConfig.colorWhite,
                              ),
                              //
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Transaction History',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 20.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        border: Border.all(
                          color: ColorsConfig.colorGreyy,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                      ),
                      // width: Get.width * 0.65,
                      child: TabBar(
                          controller: tabController,
                          isScrollable: false,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              25.0,
                            ),
                            color: ColorsConfig.colorBlue,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: myTabs),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsConfig.colorLightGrey,
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: 0),
                                leading: const Icon(
                                  Icons.add_circle,
                                ),
                                title: const Text('sakshi Agrawal'),
                                trailing: Wrap(
                                  spacing: 12, // space between two icons
                                  children: const <Widget>[
                                    Text('15 june 2022, 4:00 PM'),
                                    Text('${'+1000 '}\u{20B9}'), // icon-2
                                  ],
                                ),
                              );
                            }),
                      ),
                      Container(
                        color: Colors.yellow,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorsConfig.colorLightGrey,
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: 0),
                                leading: const Icon(
                                  Icons.add_circle,
                                ),
                                title: const Text('sakshi Agrawal'),
                                trailing: Wrap(
                                  spacing: 12, // space between two icons
                                  children: const <Widget>[
                                    Text('15 june 2022, 4:00 PM'),
                                    Text('${'+1000 '}\u{20B9}'), // icon-2
                                  ],
                                ),
                              );
                            }),
                      ),
                    ][tabController!.index],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          text: 'My Wallet',
          isAssessment: false,
        ),
      ),
    );
  }
}
