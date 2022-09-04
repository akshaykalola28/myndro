import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/packages/packages.dart';

import 'routes.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PackagesScreen.pageId,
      getPages: appPages,
    );
  }
}
