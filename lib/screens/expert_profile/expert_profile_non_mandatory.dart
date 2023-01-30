import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:myndro/widgets/widgets.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../model/model.dart';
import '../../util/common.dart';

class ExpertProfileNonMandatory extends GetView<ExpertProfileController> {
  static const pageId = "/ExpertProfileNonMandatory";

  const ExpertProfileNonMandatory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ExpertLayout(
          leadingIcon: Icons.arrow_back,
          onDrawerClick: () {
            Get.back();
          },
          text: 'Expert Profile(Non Mandatory)',
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Form(
              key: controller.formKey,
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
                          backgroundImage: controller.profileImage != null
                              ? FileImage(controller.profileImage)
                                  as ImageProvider
                              : AssetImage(ImagePath.girl),
                        ),
                        Positioned(
                            bottom: 0,
                            right: -25,
                            child: RawMaterialButton(
                              onPressed: () {
                                controller.pickImage();
                              },
                              elevation: 2.0,
                              fillColor: ColorsConfig.colorBlue,
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: ColorsConfig.colorWhite,
                              ),
                              padding: const EdgeInsets.all(10.0),
                              shape: const CircleBorder(),
                            )),
                      ],
                    ),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  outlinedTextField(controller.bioController, false,
                      Common.validateName, TextInputType.multiline, 'Bio', 4),
                  const SizedBox(
                    height: 10,
                  ),
                  titleData('Work Experience'),
                  const SizedBox(
                    height: 8,
                  ),
                  commonTextSubText(
                      'Work Experience Details',
                      controller.workController,
                      'Experience Certificate',
                      controller.workYearController),
                  const SizedBox(
                    height: 15,
                  ),
                  titleData('Awards & Recognitions'),
                  const SizedBox(
                    height: 8,
                  ),
                  commonTextSubText(
                      'Awards & Recognitions Detail',
                      controller.awardsController,
                      'Award Certificate',
                      controller.awardYearController),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  commonTextSubText(
                      'Training Certificate Detail',
                      controller.trainingController,
                      'Training Certificate',
                      controller.trainingYearController),
                  const SizedBox(
                    height: 15,
                  ),
                  titleData('Experts - Skills And Abilities',
                      isAddVisible: false),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Expertise',
                    style: TextStyle(
                        color: ColorsConfig.colorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MultiSelectDialogField(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    title: const Text('Expertise'),
                    searchHint: 'Expertise',
                    buttonIcon: const Icon(Icons.add),
                    buttonText: const Text('Expertise'),
                    items: controller.expertiseList
                        .map((e) => MultiSelectItem(e, e.name ?? ''))
                        .toList(),
                    listType: MultiSelectListType.LIST,
                    onConfirm: (List<ServicesModel> values) {
                      controller.selectedExpertise = values;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Specialization',
                    style: TextStyle(
                        color: ColorsConfig.colorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MultiSelectDialogField(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    title: const Text('Specialization'),
                    searchHint: 'Specialization',
                    buttonIcon: const Icon(Icons.add),
                    buttonText: const Text('Specialization'),
                    items: controller.specializationList
                        .map((e) => MultiSelectItem(e, e.name ?? ''))
                        .toList(),
                    listType: MultiSelectListType.LIST,
                    onConfirm: (List<ServicesModel> values) {
                      controller.selectedSpecialization = values;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Treatment Approach',
                    style: TextStyle(
                        color: ColorsConfig.colorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MultiSelectDialogField(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    title: const Text('Treatment Approach'),
                    searchHint: 'Treatment Approach',
                    buttonIcon: const Icon(Icons.add),
                    buttonText: const Text('Treatment Approach'),
                    items: controller.treatApproachList
                        .map((e) => MultiSelectItem(e, e.name ?? ''))
                        .toList(),
                    listType: MultiSelectListType.LIST,
                    onConfirm: (List<ServicesModel> values) {
                      controller.selectedTreatApproach = values;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  titleData('Consultation Info', isAddVisible: false),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Language',
                    style: TextStyle(
                        color: ColorsConfig.colorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MultiSelectDialogField(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    title: const Text('Languages'),
                    searchHint: 'Languages',
                    buttonIcon: const Icon(Icons.add),
                    buttonText: const Text('Languages'),
                    items: controller.languagesList
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList(),
                    listType: MultiSelectListType.LIST,
                    onConfirm: (List<OnBoardingModel> values) {
                      controller.selectedLanguages = values;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Session Duration',
                    style: TextStyle(
                        color: ColorsConfig.colorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Radio(
                          value: 1,
                          groupValue: controller.radioSelected.value,
                          activeColor: ColorsConfig.colorBlue,
                          onChanged: (value) {
                            controller.radioSelected.value = value as int;
                            controller.radioVal = '15 Min';
                          },
                        ),
                      ),
                      const Text('15 Min'),
                      Expanded(
                        child: Radio(
                          value: 2,
                          groupValue: controller.radioSelected.value,
                          activeColor: ColorsConfig.colorBlue,
                          onChanged: (value) {
                            controller.radioSelected.value = value as int;
                            controller.radioVal = '30 Min';
                          },
                        ),
                      ),
                      const Text('30 Min'),
                      Expanded(
                        child: Radio(
                          value: 3,
                          groupValue: controller.radioSelected.value,
                          activeColor: ColorsConfig.colorBlue,
                          onChanged: (value) {
                            controller.radioSelected.value = value as int;
                            controller.radioVal = '45 Min';
                          },
                        ),
                      ),
                      const Text('45 Min'),
                      Expanded(
                        child: Radio(
                          value: 4,
                          groupValue: controller.radioSelected.value,
                          activeColor: ColorsConfig.colorBlue,
                          onChanged: (value) {
                            controller.radioSelected.value = value as int;
                            controller.radioVal = '60 Min';
                          },
                        ),
                      ),
                      const Text('60 Min'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Session Price',
                    style: TextStyle(
                        color: ColorsConfig.colorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.phone_in_talk_rounded,
                            size: 35, color: ColorsConfig.colorWhite),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsConfig.colorBlue),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: outlinedTextField(
                            controller.callPriceController,
                            false,
                            Common.validateName,
                            TextInputType.number,
                            'call price',
                            1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.videocam,
                            size: 35, color: ColorsConfig.colorWhite),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsConfig.colorBlue),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: outlinedTextField(
                            controller.videCallPriceController,
                            false,
                            Common.validateName,
                            TextInputType.number,
                            'video call price',
                            1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.addNonMandatoryData();
                      }
                    },
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsConfig.colorBlue,
                          border: Border.all(
                              color: ColorsConfig.colorBlue, width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(
                              12.0)), // Set rounded corner radius
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Center(
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ))),
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

//////TODO language API,non mandatory changes requred
  Widget commonTextSubText(String title, TextEditingController textController,
      String textattach, TextEditingController yearController) {
    return Column(children: [
      outlinedTextField(textController, false, Common.validateName,
          TextInputType.multiline, title, 2),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Expanded(
            child: outlinedTextField(yearController, false, Common.validateName,
                TextInputType.multiline, 'year', 1),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: ColorsConfig.colorGreyy, width: 1.0),
                borderRadius: const BorderRadius.all(
                    Radius.circular(12.0)), // Set rounded corner radius
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Attach $textattach',
                    style: const TextStyle(
                        color: ColorsConfig.colorGreyy,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.attach_file,
                    color: ColorsConfig.colorGreyy,
                    size: 25,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
