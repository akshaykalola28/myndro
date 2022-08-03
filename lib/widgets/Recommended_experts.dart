import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../screens/screens.dart';
import '../util/common.dart';

final List<String> expertImg = [
  ImagePath.girl,
  ImagePath.girl,
  ImagePath.girl,
  ImagePath.girl,
  ImagePath.girl,
];

class RecommendedExperts extends StatelessWidget {
  const RecommendedExperts({Key? key, this.imgItem}) : super(key: key);
  final String? imgItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(ExpertDetailScreen.pageId),
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorsConfig.colorBlack,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended  Experts',
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: ColorsConfig.colorBlack,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorsConfig.colorBlack,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imgItem!,
                      fit: BoxFit.cover,
                      // height: 80,
                      width: Get.width * 0.2,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Sophia',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: ColorsConfig.colorBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'psychiatrist',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 14.0,
                          color: ColorsConfig.colorGreyy,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'specialities',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 16.0,
                          color: ColorsConfig.colorBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'psychiatrist',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 14.0,
                          color: ColorsConfig.colorGreyy,
                        ),
                      ),
                      // RatingBar.builder(
                      //   itemSize: 22,
                      //   initialRating: 3,
                      //   minRating: 0,
                      //   direction: Axis.horizontal,
                      //   allowHalfRating: true,
                      //   itemCount: 5,
                      //   // itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      //   itemBuilder: (context, _) => const Icon(
                      //     Icons.star,
                      //     color: ColorsConfig.colorBlue,
                      //   ),
                      //   onRatingUpdate: (rating) {
                      //     print(rating);
                      //   },
                      // )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Common.iconContainer(
                      Icons.phone_in_talk_rounded, 'Audio call',
                      isPriceVisible: true, subText: '\u{20B9}${' 400'}'),
                ),
                Expanded(
                  child: Common.iconContainer(Icons.videocam, 'Video call',
                      isPriceVisible: true, subText: '\u{20B9}${' 500'}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
