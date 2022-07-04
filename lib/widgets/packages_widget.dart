import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

final List<String> hosImg = [
  ImagePath.hospital1,
  ImagePath.hospital1,
  ImagePath.hospital1,
  ImagePath.hospital1,
  ImagePath.hospital1,
];

class PackagesWidget extends StatelessWidget {
  const PackagesWidget({Key? key, this.item}) : super(key: key);
  final String? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsConfig.colorBlack,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hospital Happiness Program',
            style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 20.0,
                color: ColorsConfig.colorBlack,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 0,
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * 0.4,
                  child: Text(
                    'Frontline employees in hospitals have worked lengthy hours without rest during the COVID-19 outbreak. They continued to work despite.',
                    style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 13.0,
                      color: ColorsConfig.colorBlack,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                    width: Get.width * 0.35,
                    child: Image.asset(
                      item!,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
