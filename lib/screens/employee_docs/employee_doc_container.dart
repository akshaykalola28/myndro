import 'package:flutter/material.dart';
import 'package:myndro/constant/colors_config.dart';

import '../../constant/constant.dart';

class EmployeeDocContainer extends StatelessWidget {
  EmployeeDocContainer(
      {Key? key, this.patientName, this.age, this.packageName, this.caseNo})
      : super(key: key);
  String? patientName;
  String? age;
  String? packageName;
  String? caseNo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 30,
                ),
                Expanded(
                  child: Text(
                    'Patient Name',
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      color: ColorsConfig.colorGreyy,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Age',
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      color: ColorsConfig.colorGreyy,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Package',
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      color: ColorsConfig.colorGreyy,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Text(
                    'Document',
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 15.0,
                      color: ColorsConfig.colorGreyy,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: ColorsConfig.colorGreyy,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(ImagePath.iconHuman)),
                      color: ColorsConfig.colorBlue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    patientName!,
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorGreyy,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${age!} years',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorGreyy,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    patientName!,
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorGreyy,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          color: ColorsConfig.colorBlue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: ColorsConfig.colorBlue,
                          )),
                      child: Text(
                        'View Doc',
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 14.0,
                            color: ColorsConfig.colorWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          color: ColorsConfig.colorGreyy,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: ColorsConfig.colorGreyy,
                          )),
                      child: Text(
                        'upload Doc',
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 14.0,
                            color: ColorsConfig.colorWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 32,
                ),
                Expanded(
                  child: Text(
                    'Case No.: $caseNo',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorGreyy,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      color: ColorsConfig.colorBlue,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: ColorsConfig.colorBlue,
                      )),
                  child: Text(
                    'Send',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
