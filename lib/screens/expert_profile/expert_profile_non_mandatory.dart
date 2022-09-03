import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/common.dart';

class ExpertProfileNonMandatory extends GetView<ExpertProfileController> {
  static const pageId = "/ExpertProfileNonMandatory";

  ExpertProfileNonMandatory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
          leadingIcon: Icons.arrow_back,
          onDrawerClick: () {
            Get.back();
          },
          text: 'Expert Profile(Non Mandatory)',
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(ImagePath.girl),
                      ),
                      Positioned(
                          bottom: 0,
                          right: -25,
                          child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: ColorsConfig.colorBlue,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: ColorsConfig.colorWhite,
                            ),
                            padding: EdgeInsets.all(10.0),
                            shape: CircleBorder(),
                          )),
                    ],
                  ),
                )),
                const SizedBox(
                  height: 10,
                ),
                outlinedTextField(controller.titleController, false,
                    Common.validateName, TextInputType.multiline, 'Bio', 4),
                const SizedBox(
                  height: 10,
                ),
                titleData('Work Experience'),
                const SizedBox(
                  height: 8,
                ),
                CommonTextSubText('Work Experience Details', 'year'),
                const SizedBox(
                  height: 15,
                ),
                titleData('Awards & Recognitions'),
                const SizedBox(
                  height: 8,
                ),
                CommonTextSubText('Awards & Recognitions Detail', 'year'),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                CommonTextSubText('Training Certificate Detail', 'year'),
                const SizedBox(
                  height: 15,
                ),
                titleData('Experts - Skills And Abilities',
                    isAddVisible: false),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Expertise',
                  style: TextStyle(
                      color: ColorsConfig.colorBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> x) {
                    controller.selected.value = x;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  )),
                  options: ['a', 'b', 'c', 'd'],
                  selectedValues: controller.selected.value,
                  whenEmpty: 'Category',
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Specialization',
                  style: TextStyle(
                      color: ColorsConfig.colorBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> x) {
                    controller.selected.value = x;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  )),
                  options: ['a', 'b', 'c', 'd'],
                  selectedValues: controller.selected.value,
                  whenEmpty: 'Category',
                ),
                const SizedBox(
                  height: 15,
                ),
                titleData('Consultation Info', isAddVisible: false),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Language',
                  style: TextStyle(
                      color: ColorsConfig.colorBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> x) {
                    controller.selected.value = x;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  )),
                  options: ['a', 'b', 'c', 'd'],
                  selectedValues: controller.selected.value,
                  whenEmpty: 'Category',
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Session Duration',
                  style: TextStyle(
                      color: ColorsConfig.colorBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> x) {
                    controller.selected.value = x;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  )),
                  options: ['a', 'b', 'c', 'd'],
                  selectedValues: controller.selected.value,
                  whenEmpty: 'Category',
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Session Price',
                  style: TextStyle(
                      color: ColorsConfig.colorBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> x) {
                    controller.selected.value = x;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  )),
                  options: ['a', 'b', 'c', 'd'],
                  selectedValues: controller.selected.value,
                  whenEmpty: 'Category',
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsConfig.colorBlue,
                      border:
                          Border.all(color: ColorsConfig.colorBlue, width: 1.0),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(12.0)), // Set rounded corner radius
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Save Changes',
                        style: TextStyle(
                            color: ColorsConfig.colorWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }

  Widget titleData(String text, {bool isAddVisible = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: AppTextStyle.microsoftJhengHei,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: ColorsConfig.colorBlue,
          ),
        ),
        isAddVisible
            ? IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
                color: ColorsConfig.colorBlue,
              )
            : Container()
      ],
    );
  }

  Widget CommonTextSubText(String title, String year) {
    return Column(children: [
      outlinedTextField(controller.titleController, false, Common.validateName,
          TextInputType.multiline, title, 2),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Container(
            width: Get.width * 0.3,
            child: outlinedTextField(controller.titleController, false,
                Common.validateName, TextInputType.multiline, year, 1),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: ColorsConfig.colorGreyy, width: 1.0),
              borderRadius: const BorderRadius.all(
                  Radius.circular(12.0)), // Set rounded corner radius
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Text(
                  'Attach Certificate',
                  style: TextStyle(
                      color: ColorsConfig.colorGreyy,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.attach_file,
                  color: ColorsConfig.colorGreyy,
                  size: 25,
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: ColorsConfig.colorBlue,
          )
        ],
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 90,
          decoration: BoxDecoration(
            color: ColorsConfig.colorBlue,
            border: Border.all(color: ColorsConfig.colorBlue, width: 1.0),
            borderRadius: const BorderRadius.all(
                Radius.circular(12.0)), // Set rounded corner radius
          ),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              'Upload',
              style: TextStyle(
                  color: ColorsConfig.colorWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ]);
  }
}
