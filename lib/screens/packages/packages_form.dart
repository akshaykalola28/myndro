import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class PackagesFormScreen extends GetView<PackagesController> {
  static const pageId = "/PackagesFormScreen";

  const PackagesFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(body: Obx(() {
        return ExpertLayout(
          leadingIcon: Icons.arrow_back,
          onDrawerClick: () {
            Get.back();
          },
          isPackageForm: true,
          text: 'CHP-Corporate Happiness Program',
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'Name', 1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(
                    controller.titleController,
                    false,
                    Common.validateName,
                    TextInputType.text,
                    'Name Of Company',
                    1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'Email ID', 1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'Mobile NO:', 1,
                    isPackageForm: true),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Company Size:',
                  style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 18.0,
                    color: ColorsConfig.colorBlack,
                  ),
                ),
                Row(
                  children: [
                    const Text('0-100'),
                    Expanded(
                      child: Radio(
                        value: 1,
                        groupValue: controller.radioSelected.value,
                        activeColor: ColorsConfig.colorBlue,
                        onChanged: (value) {
                          controller.radioSelected.value = value as int;
                          controller.radioVal = '0-100';
                        },
                      ),
                    ),
                    const Text('100-200'),
                    Expanded(
                      child: Radio(
                        value: 2,
                        groupValue: controller.radioSelected.value,
                        activeColor: ColorsConfig.colorBlue,
                        onChanged: (value) {
                          controller.radioSelected.value = value as int;
                          controller.radioVal = '100-200';
                        },
                      ),
                    ),
                    const Text('200-500'),
                    Expanded(
                      child: Radio(
                        value: 3,
                        groupValue: controller.radioSelected.value,
                        activeColor: ColorsConfig.colorBlue,
                        onChanged: (value) {
                          controller.radioSelected.value = value as int;
                          controller.radioVal = '200-500';
                        },
                      ),
                    ),
                    const Text('500+'),
                    Expanded(
                      child: Radio(
                        value: 4,
                        groupValue: controller.radioSelected.value,
                        activeColor: ColorsConfig.colorBlue,
                        onChanged: (value) {
                          controller.radioSelected.value = value as int;
                          controller.radioVal = '500+';
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'Website', 1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(
                    controller.titleController,
                    false,
                    Common.validateName,
                    TextInputType.text,
                    'Comapny Landline No',
                    1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'Your Role', 1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'Address', 3,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'City', 1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'Pincode', 1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'State', 1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.text, 'Country', 1,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(
                    controller.titleController,
                    false,
                    Common.validateName,
                    TextInputType.text,
                    'Other Info/Message',
                    4,
                    isPackageForm: true),
                const SizedBox(
                  height: 10,
                ),
                loginButtonWidget(
                  'Submit',
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}
