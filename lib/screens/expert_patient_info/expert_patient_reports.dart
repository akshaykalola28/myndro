import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class ExpertPatientReports extends GetView<ExpertPatientInfoController> {
  static const pageId = "/ExpertPatientReports";

  const ExpertPatientReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
          leadingIcon: Icons.arrow_back,
          onDrawerClick: () {
            Get.back();
          },
          text: 'Patient Documents',
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              color: Colors.white,
              child: ListView.separated(
                primary: true,
                itemCount: 13,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return ExpertReportTileWidget();
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
          )),
    );
  }
}
