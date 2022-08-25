import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class ExpertHome extends StatefulWidget {
  static const pageId = "/ExpertHome";

  ExpertHome({Key? key}) : super(key: key);

  @override
  State<ExpertHome> createState() => _ExpertHomeState();
}

class _ExpertHomeState extends State<ExpertHome>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ExpertHomeController controller = ExpertHomeController();
  final List<Tab> myTabs = <Tab>[
    const Tab(text: "Today's Appointment"),
    const Tab(text: 'Quick Connect'),
    const Tab(text: 'Upcoming Appointments'),
    const Tab(text: 'Slot Schedule'),
  ];
  TabController? tabController;

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: myTabs.length, vsync: this);
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
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: ColorsConfig.colorBlue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(ImagePath.iconHuman)),
                          color: ColorsConfig.colorGreen,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Ms. Anil Patel',
                        maxLines: 2,
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 23.0,
                            // fontWeight: FontWeight.w600,
                            color: ColorsConfig.colorWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle_outlined,
                size: 30,
                color: ColorsConfig.colorWhite,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: ColorsConfig.colorWhite),
              ),
              onTap: () {
                Get.back();
                // Get.toNamed(SettingScreen.pageId);
              },
            ),
            ListTile(
              leading: Image.asset(
                ImagePath.nav2,
                color: ColorsConfig.colorWhite,
                height: 30,
              ),
              title: Text(
                'Appointment',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: ColorsConfig.colorWhite),
              ),
              onTap: () {
                Get.back();
                Get.toNamed(ExpertAppointment.pageId);
              },
            ),
            ListTile(
              leading: Image.asset(
                ImagePath.myPackagesImg,
                color: ColorsConfig.colorWhite,
                height: 30,
              ),
              title: Text(
                'My Packages',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: ColorsConfig.colorWhite),
              ),
              onTap: () {
                Get.back();
                // Get.toNamed(PackagesScreen.pageId);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.calendar_month_outlined,
                size: 30,
                color: ColorsConfig.colorWhite,
              ),
              title: Text(
                'Calender',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: ColorsConfig.colorWhite),
              ),
              onTap: () {
                Get.back();
                // Get.toNamed(SettingScreen.pageId);
              },
            ),
            ListTile(
              leading: Image.asset(
                ImagePath.patientInfoImg,
                color: ColorsConfig.colorWhite,
                height: 30,
              ),
              title: Text(
                'Patient Info',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: ColorsConfig.colorWhite),
              ),
              onTap: () {
                Get.back();
                // Get.toNamed(PackagesScreen.pageId);
              },
            ),
            ListTile(
              leading: Image.asset(
                ImagePath.askImg,
                color: ColorsConfig.colorWhite,
                height: 30,
              ),
              title: Text(
                'Messages',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: ColorsConfig.colorWhite),
              ),
              onTap: () {
                Get.back();
                // Get.toNamed(AskUSScreen.pageId);
              },
            ),
            ListTile(
              leading: Image.asset(
                ImagePath.reportImg,
                color: ColorsConfig.colorWhite,
                height: 30,
              ),
              title: Text(
                'Reports',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: ColorsConfig.colorWhite),
              ),
              onTap: () {
                Get.back();
                // Get.toNamed(PackagesScreen.pageId);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                size: 30,
                color: ColorsConfig.colorWhite,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: ColorsConfig.colorWhite),
              ),
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: ExpertLayout(
        leadingIcon: Icons.menu,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    homeContainer(
                        ColorsConfig.colorGreen,
                        ColorsConfig.colorBlue,
                        'Total Appointments',
                        '1620',
                        Icons.calendar_month_outlined),
                    homeContainer(
                        ColorsConfig.colorBlue,
                        ColorsConfig.colorGreen,
                        'Total Patients',
                        '1620',
                        Icons.person_outline),
                    homeContainer(
                        ColorsConfig.colorGreen,
                        ColorsConfig.colorBlue,
                        'Total Income',
                        '1620',
                        Icons.currency_rupee),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(thickness: 3, color: ColorsConfig.colorGrey),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TabBar(
                        controller: tabController,
                        isScrollable: true,
                        indicatorColor: ColorsConfig.colorBlue,
                        labelColor: ColorsConfig.colorBlue,
                        unselectedLabelColor: Colors.black,
                        tabs: myTabs),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: [
                        ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return appointmentContainer(
                                  'data', '19Jan,5:45', 'M 0001');
                            }),
                        ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return quickConnect(
                                  'data', '19Jan,5:45', 'M 0001');
                            }),
                        ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return appointmentContainer(
                                  'data', '19Jan,5:45', 'M 0001');
                            }),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Today',
                                softWrap: true,
                                style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 25.0,
                                    color: ColorsConfig.colorBlue,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '3 Slots Available',
                                softWrap: true,
                                style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 25.0,
                                    color: ColorsConfig.colorGreen,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        childAspectRatio: 3),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      border: Border.all(
                                        color: ColorsConfig.colorBlack,
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '0:10',
                                        style: TextStyle(
                                            fontFamily:
                                                AppTextStyle.microsoftJhengHei,
                                            fontSize: 15.0,
                                            color: ColorsConfig.colorBlack,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 1,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 15),
                                decoration: BoxDecoration(
                                    color: ColorsConfig.colorBlue,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                      color: ColorsConfig.colorBlue,
                                    )),
                                child: Text(
                                  'Edit Slot',
                                  style: TextStyle(
                                      fontFamily:
                                          AppTextStyle.microsoftJhengHei,
                                      fontSize: 20.0,
                                      color: ColorsConfig.colorWhite,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ][tabController!.index],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        text: 'Home',
        onDrawerClick: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
    );
  }

  Widget homeContainer(Color containerColor, Color iconColor, String title,
      String subTitle, IconData icon) {
    return Container(
      width: Get.width * 0.4,
      height: Get.height * 0.2,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(width: 0.0, color: Colors.transparent),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: iconColor,
              border: Border.all(width: 0.0, color: Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            softWrap: true,
            style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 18.0,
                color: ColorsConfig.colorWhite,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subTitle,
            softWrap: true,
            style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 20.0,
                color: ColorsConfig.colorWhite,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget appointmentContainer(String name, String date, String caseNo) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(ImagePath.iconHuman)),
                    color: ColorsConfig.colorBlue,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 20.0,
                        color: ColorsConfig.colorGreyy,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorGreyy.withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: ColorsConfig.colorBlue,
                            )),
                        child: Text(
                          'package',
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: ColorsConfig.colorBlue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(ExpertTodayAppointment.pageId);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                color: ColorsConfig.colorGreyy,
                              )),
                          child: Text(
                            'view',
                            style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 15.0,
                                color: ColorsConfig.colorGreyy,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Case No.: $caseNo',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 20.0,
                        color: ColorsConfig.colorGreyy,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: ColorsConfig.colorBlue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Icon(Icons.videocam,
                    color: ColorsConfig.colorWhite, size: 32),
              ),
            ],
          ),
        ));
  }

  Widget quickConnect(String name, String date, String caseNo) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(ImagePath.iconHuman)),
                        color: ColorsConfig.colorBlue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                  ),
                  Text(
                    name,
                    softWrap: true,
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 20.0,
                        color: ColorsConfig.colorGreyy,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: ColorsConfig.colorBlue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Icon(Icons.videocam,
                        color: ColorsConfig.colorWhite, size: 32),
                  ),
                  const Icon(Icons.check_circle_outline_outlined,
                      color: Colors.green, size: 40),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.red,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: const Center(
                        child: Icon(Icons.close, color: Colors.red, size: 25)),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Case No.: $caseNo',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorGreyy,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorGreyy.withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
