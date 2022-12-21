import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/common.dart';
import '../screens.dart';

class DashboardScreen extends StatefulWidget {
  static const pageId = "/DashboardScreen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
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
                        // height: 90,
                        // width: 90,
                        padding: const EdgeInsets.all(30),
                        // child: Text(
                        //   _username.substring(0, 1).toUpperCase(),
                        //   style: TextStyle(
                        //       fontFamily: AppTextStyle.microsoftJhengHei,
                        //       fontSize: 28.0,
                        //       fontWeight: FontWeight.w900,
                        //       color: ColorsConfig.colorBlack),
                        // ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(ImagePath.iconHuman)),
                          color: ColorsConfig.colorGreen,
                          shape: BoxShape.circle,
                          /*  borderRadius:
                                const BorderRadius.all(Radius.circular(50)) */
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          _username,
                          maxLines: 2,
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 23.0,
                              // fontWeight: FontWeight.w600,
                              color: ColorsConfig.colorWhite),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 30,
                  color: ColorsConfig.colorWhite,
                ),
                title: Text(
                  'My Wallet',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: ColorsConfig.colorWhite),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(WalletScreen.pageId);
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
                  Get.toNamed(UpcomingAppointments.pageId);
                },
              ),
              ListTile(
                leading: Image.asset(
                  ImagePath.assessmentIcon,
                  color: ColorsConfig.colorWhite,
                  height: 30,
                ),
                title: Text(
                  'Assessment',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: ColorsConfig.colorWhite),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(AllAssessmentsNav.pageId);
                },
              ),
              ListTile(
                leading: Image.asset(
                  ImagePath.pack2,
                  color: ColorsConfig.colorWhite,
                  height: 30,
                ),
                title: Text(
                  'Packages',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: ColorsConfig.colorWhite),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(PackagesScreen.pageId);
                },
              ),
              ListTile(
                leading: Image.asset(
                  ImagePath.offersImg,
                  color: ColorsConfig.colorWhite,
                  height: 30,
                ),
                title: Text(
                  'Offers',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: ColorsConfig.colorWhite),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(OffersScreen.pageId);
                },
              ),
              ListTile(
                leading: Image.asset(
                  ImagePath.askImg,
                  color: ColorsConfig.colorWhite,
                  height: 30,
                ),
                title: Text(
                  'Ask Us',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: ColorsConfig.colorWhite),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(AskUSScreen.pageId);
                },
              ),
              ListTile(
                leading: Image.asset(
                  ImagePath.imgNote,
                  color: ColorsConfig.colorWhite,
                  height: 30,
                ),
                title: Text(
                  ' Doctor Notes',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: ColorsConfig.colorWhite),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(DoctorNotesScreen.pageId);
                },
              ),
              ListTile(
                leading: Image.asset(
                  ImagePath.lockerImg,
                  color: ColorsConfig.colorWhite,
                  height: 30,
                ),
                title: Text(
                  'Myndro Locker',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: ColorsConfig.colorWhite),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(MyndroLockerScreen.pageId);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: ColorsConfig.colorWhite,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: ColorsConfig.colorWhite),
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(SettingScreen.pageId);
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
                  Common.clearPrefData();
                  Get.offAllNamed(LoginScreen.pageId);
                  // controller.dispose();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: ColorsConfig.colorBlue,
          selectedItemColor: ColorsConfig.colorBlue,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              icon: ImagePath.nav1,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: ImagePath.nav2,
              label: 'Appointment',
            ),
            _bottomNavigationBarItem(
              icon: ImagePath.nav3,
              label: 'Offers',
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomeScreen(onDrawerClick: () {
              _scaffoldKey.currentState!.openDrawer();
            }),
            // const ExpertDetailScreen(),
            SearchScreen(
              allTextList: controller.allDoctors,
              selectedUserList: controller.selectedUserList,
            ),
            OffersScreen(),
          ],
        ),

        /*IndexedStack(
          index: controller.tabIndex,
          children: const [
            HomeScreen(),
            AssessmentScreen(),
            CreatePasswordScreen(),
          ],
        ),*/
      );
    });
  }

  _bottomNavigationBarItem({String? icon, String? label}) {
    return BottomNavigationBarItem(
      activeIcon: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: ColorsConfig.colorBlue,
          border: Border.all(
            color: ColorsConfig.colorBlue,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            icon!,
            height: 25,
            width: 25,
            color: ColorsConfig.colorWhite,
            fit: BoxFit.contain,
          ),
        ),
      ),
      icon: Image.asset(
        icon,
        height: 25,
        width: 25,
      ),
      label: label ?? '',
    );
  }
}
