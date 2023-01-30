import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class ExpertNotesWidget extends StatelessWidget {
  const ExpertNotesWidget({Key? key, this.date, this.title, this.subject})
      : super(key: key);
  final String? date;
  final String? title;
  final String? subject;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date!,
          style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 12.0,
              color: ColorsConfig.colorGreyy,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 8,
        ),
        Material(
          elevation: 5,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: ColorsConfig.colorWhite.withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 16.0,
                      color: ColorsConfig.colorBlack,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  subject!,
                  softWrap: true,
                  maxLines: 10,
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 14.0,
                      color: ColorsConfig.colorGreyy,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Row(
          children: [
            // Container(
            //   decoration: const BoxDecoration(
            //     color: ColorsConfig.colorBlue,
            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //   ),
            //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //   child: Text(
            //     'Save Note',
            //     style: TextStyle(
            //         fontFamily: AppTextStyle.microsoftJhengHei,
            //         fontSize: 15.0,
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // const SizedBox(
            //   width: 15,
            // ),
            Container(
              decoration: const BoxDecoration(
                color: ColorsConfig.colorBlue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Share',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
