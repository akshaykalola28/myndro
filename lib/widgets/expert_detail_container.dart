import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../constant/constant.dart';
import '../util/common.dart';

class ExpertDetailContainer extends StatelessWidget {
  const ExpertDetailContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsConfig.colorLightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(ImagePath.iconHuman)),
                      color: ColorsConfig.colorBlue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'nnnnnnn',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                          color: ColorsConfig.colorBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'dcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskf',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: ColorsConfig.colorGreyy,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Specialities',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: ColorsConfig.colorBlack.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'dcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskf',
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: ColorsConfig.colorGreyy,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LikeButton(
                            size: 35,
                            circleColor: const CircleColor(
                                start: Color(0xff00ddff),
                                end: Color(0xff0099cc)),
                            bubblesColor: const BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.thumb_up,
                                color: isLiked
                                    ? ColorsConfig.colorBlue
                                    : Colors.grey,
                                size: 35,
                              );
                            },
                            likeCount: 96,
                            countBuilder:
                                (int? count, bool isLiked, String text) {
                              var color = isLiked
                                  ? ColorsConfig.colorBlue
                                  : Colors.grey;
                              Widget result;
                              if (count == 0) {
                                result = Text(
                                  '',
                                  style: TextStyle(color: color, fontSize: 18),
                                );
                              } else {
                                result = Text(
                                  text,
                                  style: TextStyle(color: color, fontSize: 18),
                                );
                              }
                              return result;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                      child:
                          Common.iconContainer(Icons.videocam, 'Video call')),
                  Expanded(
                      child: Common.iconContainer(
                          Icons.phone_in_talk_rounded, 'Audio call'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
