import 'package:flutter/cupertino.dart';
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
          selectedItemColor: ColorsConfig.colorBlack,
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
      icon: Image.asset(
        icon!,
        height: 25,
        width: 25,
      ),
      label: label ?? '',
    );
  }
}
