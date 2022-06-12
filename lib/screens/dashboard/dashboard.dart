import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.redAccent,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              icon: CupertinoIcons.home,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: CupertinoIcons.sportscourt,
              label: 'News',
            ),
            _bottomNavigationBarItem(
              icon: CupertinoIcons.bell,
              label: 'Alerts',
            ),
            _bottomNavigationBarItem(
              icon: CupertinoIcons.person,
              label: 'Account',
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            EnterPhoneNumber(),
            EnterPhoneNumber(),
            EnterPhoneNumber(),
            EnterPhoneNumber(),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
