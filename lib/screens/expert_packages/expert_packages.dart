import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class ExpertPackages extends GetView<ExpertPackagesController> {
  static const pageId = "/ExpertPackages";

  const ExpertPackages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExpertLayout(
      leadingIcon: Icons.arrow_back,
      onDrawerClick: () {
        Get.back();
      },
      text: 'My Packages',
      body: GestureDetector(
          onTap: () {
            Get.focusScope!.unfocus();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 15, 12, 0),
                  child: Column(
                    children: [
                      outlinedTextField(
                          controller.titleController,
                          false,
                          Common.validateName,
                          TextInputType.text,
                          'Package Title',
                          1),
                      const SizedBox(
                        height: 8,
                      ),
                      outlinedTextField(
                          controller.titleController,
                          false,
                          Common.validateName,
                          TextInputType.text,
                          'Package Details',
                          4),
                      const SizedBox(
                        height: 8,
                      ),
                      outlinedTextField(
                          controller.titleController,
                          false,
                          Common.validateName,
                          TextInputType.text,
                          'Total No. of Session',
                          1),
                      const SizedBox(
                        height: 8,
                      ),
                      outlinedTextField(
                          controller.titleController,
                          false,
                          Common.validateName,
                          TextInputType.text,
                          'Session Duration',
                          1),
                      const SizedBox(
                        height: 8,
                      ),
                      outlinedTextField(
                          controller.titleController,
                          false,
                          Common.validateName,
                          TextInputType.text,
                          'Package Price',
                          1),
                      const SizedBox(
                        height: 12,
                      ),
                      loginButtonWidget(
                        'Send to Admin Approval',
                        () {
                          Get.toNamed(ExpertPackagesList.pageId);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
