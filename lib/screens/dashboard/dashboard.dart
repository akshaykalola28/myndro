import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/constant/constant.dart';
import 'package:myndro/screens/screens.dart';

import '../../controller/controller.dart';

class DashboardScreen extends StatelessWidget {
  static const pageId = "/DashboardScreen";

  DashboardScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // final controller = Get.put(dashboardController());
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
                      Stack(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                color: ColorsConfig.colorGreen,
                                border:
                                    Border.all(color: ColorsConfig.colorBlue),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 10,
                            child: Container(
                              width: 75.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      ImagePath.humanPhone,
                                    ),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                  color: ColorsConfig.colorGreen,
                                  border: Border.all(
                                      color: ColorsConfig.colorGreen),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Ms. Mansi Mehta',
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
                  Navigator.pop(context);
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
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  size: 30,
                  color: ColorsConfig.colorWhite,
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
                  Navigator.pop(context);
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
                  Navigator.pop(context);
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
                  Navigator.pop(context);
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
                  Navigator.pop(context);
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
                  Navigator.pop(context);
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
            AllAssessmentsNav(),
            CreatePasswordScreen(),
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
