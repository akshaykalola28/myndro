import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class ExpertPatientNotes extends GetView<ExpertPatientInfoController> {
  static const pageId = "/ExpertPatientNotes";

  const ExpertPatientNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
          leadingIcon: Icons.arrow_back,
          onDrawerClick: () {
            Get.back();
          },
          text: 'Patient Notes',
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                          style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 15.0,
                            color: ColorsConfig.colorWhite.withOpacity(0.8),
                          ),
                          onChanged: (_) {},
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            fillColor: ColorsConfig.colorBlue,
                            filled: true,
                            suffixIcon: const Icon(
                              Icons.search,
                              color: ColorsConfig.colorWhite,
                            ),
                            hintText: 'Search something ...',
                            hintStyle: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: ColorsConfig.colorWhite.withOpacity(0.8),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Material(
                        elevation: 3,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          width: Get.width * 0.5,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            color: ColorsConfig.colorGrey.withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Case No:',
                            style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 14.0,
                                color: ColorsConfig.colorGreyy,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Material(
                        elevation: 3,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          width: Get.width * 0.7,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            color: ColorsConfig.colorGrey.withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Patient Name:',
                            style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 14.0,
                                color: ColorsConfig.colorGreyy,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: ColorsConfig.colorWhite,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 25,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return const ExpertNotesWidget(
                          date: '10th june 2022',
                          title: 'hello',
                          subject:
                              'loreal ipsum loreal ipsum loreal ipsum loreal ',
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
