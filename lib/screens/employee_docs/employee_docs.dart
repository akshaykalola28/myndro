import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class EmployeeDocs extends GetView<EmployeeDocsController> {
  static const pageId = "/EmployeeDocs";

  const EmployeeDocs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
        leadingIcon: Icons.arrow_back,
        onDrawerClick: () {
          Get.back();
        },
        text: 'My Docs',
        body: ListView.separated(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          itemCount: 15,
          itemBuilder: (context, index) {
            return EmployeeDocContainer(
              patientName: 'mansi mehta',
              age: '30',
              packageName: 'sukhometer',
              caseNo: 'M 0002',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
    );
  }
}
