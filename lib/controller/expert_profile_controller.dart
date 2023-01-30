import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myndro/screens/screens.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../services/services.dart';
import '../util/common.dart';

class ExpertProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController callPriceController = TextEditingController();
  final TextEditingController videCallPriceController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController workController = TextEditingController();
  final TextEditingController workYearController = TextEditingController();
  final TextEditingController awardsController = TextEditingController();
  final TextEditingController awardYearController = TextEditingController();
  final TextEditingController trainingController = TextEditingController();
  final TextEditingController trainingYearController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<Tab> myTabs = <Tab>[
    const Tab(text: "Info"),
    const Tab(text: 'Feedback'),
    const Tab(text: 'Docspace'),
    const Tab(text: 'Ask Anything'),
  ];
  TabController? tabController;
  bool isFromEdit = true;
  List<ServicesModel> expertiseList = <ServicesModel>[].obs;
  List<ServicesModel> specializationList = <ServicesModel>[].obs;
  List<ServicesModel> treatApproachList = <ServicesModel>[].obs;
  List<ServicesModel> selectedExpertise = [];
  List<ServicesModel> selectedSpecialization = [];
  List<ServicesModel> selectedTreatApproach = [];
  List<OnBoardingModel> selectedLanguages = [];
  RxBool isLoading = false.obs;
  RxInt radioSelected = 2.obs;
  String? radioVal;
  dynamic profileImage;
  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }

  RxList<String> selected = <String>[].obs;

  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController!.addListener(handleTabSelection);
    getExpertiseList();
    getSpecializationList();
    getTreatmentApproachList();
    super.onInit();
  }

  handleTabSelection() {
    if (tabController!.indexIsChanging) {
      update();
    }
  }

  List<OnBoardingModel> languagesList = [
    OnBoardingModel(imageAsset: '', name: 'English'),
    OnBoardingModel(imageAsset: '', name: 'Hindi'),
    OnBoardingModel(imageAsset: '', name: 'Marathi'),
    OnBoardingModel(imageAsset: '', name: 'Gujarati'),
    OnBoardingModel(imageAsset: '', name: 'Bengali'),
    OnBoardingModel(imageAsset: '', name: 'Urdu'),
    OnBoardingModel(imageAsset: '', name: 'Tamil'),
    OnBoardingModel(imageAsset: '', name: 'Marwadi'),
    OnBoardingModel(imageAsset: '', name: 'Kannada'),
    OnBoardingModel(imageAsset: '', name: 'Telugu'),
    OnBoardingModel(imageAsset: '', name: 'Singhi'),
    OnBoardingModel(imageAsset: '', name: 'Maliyalam'),
  ];
  showPopupMenu(BuildContext context, Offset offset) {
    double left = offset.dx;
    double top = offset.dy;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        const PopupMenuItem<String>(
          value: '1',
          child: Text('Mandatory'),
        ),
        const PopupMenuItem<String>(
          value: '2',
          child: Text('Non Mandatory'),
        ),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        Get.toNamed(ExpertRegistrationForm.pageId, arguments: {
          'is_edit': isFromEdit,
        });
      } else if (itemSelected == "2") {
        Get.toNamed(ExpertProfileNonMandatory.pageId);
      } else {
        //code here
      }
    });
  }

//get expertise
  void getExpertiseList() async {
    bool status = await Common.checkInternetConnection();
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getServiceExpertise();
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        expertiseList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          expertiseList.add(ServicesModel.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  //get Specialization
  void getSpecializationList() async {
    bool status = await Common.checkInternetConnection();
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getserviceSpecialization();
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        specializationList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          specializationList.add(ServicesModel.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  //get Treatment Approach
  void getTreatmentApproachList() async {
    bool status = await Common.checkInternetConnection();
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getServiceTreatmentApproach();
      var jsonData = json.decode(response.body);
      var data = jsonData["data"] as List;
      if (response.statusCode == 200) {
        treatApproachList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          treatApproachList.add(ServicesModel.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  //update profile picture
  void addExpertProfile() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.changeExpertProfile));
      request.fields
          .addAll({'doctor_id': jsonDecode(res)['data']['doctor_id']});
      request.files.add(await http.MultipartFile.fromPath(
          'doctor_profile_image', profileImage.path));

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        Common.displayMessage(jsonData["msg"] as String);
        print('jsonData $jsonData');
      } else {
        Common.displayMessage(jsonData["msg"] as String);
        print(response.reasonPhrase);
      }
    }
  }

  /// pick image
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      profileImage = imageTemp;
      addExpertProfile();
      update();
    } on PlatformException catch (e) {
      Common.displayMessage('Failed to pick image: $e');
      print('Failed to pick image: $e');
    }
  }

///////TODO certificates add karvana
  //update non mandatory data
  void addNonMandatoryData() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var request = http.MultipartRequest(
          'POST', Uri.parse(Apis.baseUrl + Apis.updateNonMandata));
      request.fields.addAll({
        'doctor_id': jsonDecode(res)['data']['doctor_id'],
        'txtExpBio': bioController.text.trim(),
        'txtAudioPrice': callPriceController.text.trim(),
        'txtVideoPrice': videCallPriceController.text.trim(),
        'SessionTime': radioVal ?? '',
        'txtExpWorkExp': workController.text.trim(),
        'txtWorkExperienceYear': workYearController.text.trim(),
        'txtDoctorAwardDes': awardsController.text.trim(),
        'txtdoctorAwardYear': awardYearController.text.trim(),
        'txtExpTrainingCertificate': trainingController.text.trim(),
        'txtTrainingYear': trainingYearController.text.trim(),
        'chkExpertise[]':
            jsonEncode(selectedExpertise.map((e) => e.name ?? '').toList()),
        'chkSpecialization[]': jsonEncode(
            selectedSpecialization.map((e) => e.name ?? '').toList()),
        'ChkLanguage[]':
            jsonEncode(selectedLanguages.map((e) => e.name).toList()),
        'TreatmentApproach[]':
            jsonEncode(selectedTreatApproach.map((e) => e.name ?? '').toList()),
      });

      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = jsonDecode(respStr);
      if (response.statusCode == 200) {
        Common.displayMessage(jsonData["msg"] as String);
        print('jsonData $jsonData');
        Get.back();
      } else {
        Common.displayMessage(jsonData["msg"] as String);
        print(response.reasonPhrase);
      }
    }
  }
}
