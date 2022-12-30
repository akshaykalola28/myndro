import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/model.dart';
import '../screens/screens.dart';
import '../services/services.dart';
import '../util/common.dart';
import 'controller.dart';

class ExpertPackagesController extends BaseController {
  @override
  void errorHandler(e) {}
  final TextEditingController packTitleController = TextEditingController();
  final TextEditingController packDetailsController = TextEditingController();
  final TextEditingController sessionNoController = TextEditingController();
  final TextEditingController sessionDurController = TextEditingController();
  final TextEditingController packPriceController = TextEditingController();
  RxBool isLoading = false.obs;
  List<MyPackagesData> packList = <MyPackagesData>[].obs;
  final formKey = GlobalKey<FormState>();
  void createExpertPackages() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    if (status) {
      var response = await RemoteServices.expertCreatePackage(
          res.isNotEmpty ? jsonDecode(res)['data']['doctor_id'] : '',
          packTitleController.text,
          packDetailsController.text,
          sessionNoController.text,
          sessionDurController.text,
          packPriceController.text);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        getPackagesList();
        Get.toNamed(ExpertPackagesList.pageId);
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  void getPackagesList() async {
    bool status = await Common.checkInternetConnection();
    var res = await Common.retrievePrefData(Common.strLoginRes);
    isLoading.value = true;
    if (status) {
      var response = await RemoteServices.getExperPackageList(
          jsonDecode(res)['data']['doctor_id']);
      var jsonData = json.decode(response.body);
      var data = jsonData["data"]['my_packages_data'] as List;
      if (response.statusCode == 200) {
        packList.clear();
        isLoading.value = false;
        for (dynamic i in data) {
          packList.add(MyPackagesData.fromJson(i));
        }
      } else {
        Common.displayMessage(jsonData["messages"] as String);
      }
    }
  }

  viewPackageDetails(BuildContext context, String packTitle, String packDetails,
      String sessionNo, String sessionDur, String packPrice) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Package Details'),
          content: SizedBox(
            height: Get.height * 0.2,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Package Title :',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                    Text(
                      packTitle,
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Package Details :',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                    Text(
                      packDetails,
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total No. of Session :',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                    Text(
                      sessionNo,
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Session Duration :',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                    Text(
                      sessionDur,
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Package Price :',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                    Text(
                      packPrice,
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 16.0,
                        color: ColorsConfig.colorBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 18.0,
                  color: ColorsConfig.colorBlue,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
