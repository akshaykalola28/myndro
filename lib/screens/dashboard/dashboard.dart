import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/constant/constant.dart';
import 'package:myndro/screens/screens.dart';

import '../../controller/controller.dart';

class DashboardScreen extends StatelessWidget {
  static const pageId = "/DashboardScreen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<dashboardController>(builder: (controller) {
      return Scaffold(
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
              label: 'Service',
            ),
            _bottomNavigationBarItem(
              icon: ImagePath.nav3,
              label: 'Profile',
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            HomeScreen(),
            LoginScreen(),
            CreatePasswordScreen(),
          ],
        ),
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
