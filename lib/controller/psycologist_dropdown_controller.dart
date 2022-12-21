import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/model/expert_sub_category.dart';

import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class PsycologistDropdownController extends BaseController {
  @override
  void errorHandler(e) {}
  String? dropdownValue;
  var getDoctorCat = Get.arguments;
  var doctorSubCatList = <Doctorsubcategory>[].obs;
  @override
  void onInit() {
    super.onInit();
    getDoctorCat = Get.arguments;
    getExpertSubCategoryList(getDoctorCat['category_id']);
  }

  final formKey = GlobalKey<FormState>();
  List<String> mentalEx = [
    'Psychologist',
    'Clinical Psychologist ',
    'Psychotherapist',
    'Therapist',
    'Counsellor',
    'Industrial/Organizational Psychologist',
    'Neuropsychologist',
    'School Counsellor',
    'School Psychologist',
    'Mental health experts',
    'Forensic Psychologist',
    'Counselling Psychologist',
    'Sports Psychologist',
    'Education Psychologist',
    'Child Psychologist',
  ];

  List<String> mediMas = ['Psychiatrist', 'other'];
  List<String> realLife = [
    'Life Coach',
    'Personal Development Coach',
    'Mindset Coach',
    'Transformational Coach',
    'Human Performance Coach ',
    'Human Behavioural Expert',
    'Life Strategist',
    'Empowerment Coach',
    'Success Coach',
    'Achievements Facilitator',
    'Performance Coach',
    'Personal Results Coach',
    'Personal Mentor',
    'Motivational Coach',
    'Health and Wellness Coach',
    'Life Transformation Strategist',
    'Yoga',
    'Meditation',
    'Nutrition',
    'Brain Power Coach',
    'Reiki Master ',
    'Wellness Coach ',
    'Mind and Body Coach',
    'Spiritual Life Coach',
    'Executive Coach',
    'Parenting & Family Coach',
    'Career Coach',
    'Small Business Coach'
  ];

  void getExpertSubCategoryList(String catId) async {
    bool status = await Common.checkInternetConnection();

    if (status) {
      var response = await RemoteServices.getExpertSubCategoryList(catId);

      var jsonData = json.decode(response.body)["data"];
      var data = jsonData["doctorsubcategory"] as List;

      if (response.statusCode == 200) {
        for (dynamic i in data) {
          doctorSubCatList.add(Doctorsubcategory.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["msg"] as String);
      }
    }
  }
}
