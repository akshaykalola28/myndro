import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../constant/constant.dart';

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
                Stack(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: ColorsConfig.colorBlue,
                          border: Border.all(color: ColorsConfig.colorBlue),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: Container(
                        width: 55.0,
                        height: 55.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImagePath.humanPhone,
                              ),
                              fit: BoxFit.fill,
                              alignment: Alignment.bottomCenter,
                            ),
                            color: ColorsConfig.colorBlue,
                            border: Border.all(color: ColorsConfig.colorBlue),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                      ),
                    ),
                  ],
                ),
                /*  Container(
                 width: 80.0,
                 height: 80.0,

                 decoration: BoxDecoration(
                   color: ColorsConfig.colorBlue,
                     border: Border.all(
                       color:ColorsConfig.colorBlue
                     ),
                     borderRadius: BorderRadius.all(Radius.circular(50))
                 ),
                 alignment: Alignment.bottomCenter, // where to position the child
                 child: Container(
                   width: 65.0,
                   height: 55.0,
                 child: Icon(Icons.person_sharp,color: ColorsConfig.colorWhite,size: 65,),
                   decoration: BoxDecoration(
                       border: Border.all(
                           color:ColorsConfig.colorBlue
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(50))
                   ),
                 ),
               ),*/

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
                  Expanded(child: iconContainer(Icons.videocam, 'Video call')),
                  Expanded(
                      child: iconContainer(
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

Widget iconContainer(IconData icon, String text,
    {bool isPriceVisible = false, String? subText}) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(6),
        child: Icon(icon, size: 25, color: ColorsConfig.colorWhite),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: ColorsConfig.colorBlue),
      ),
      SizedBox(
        width: 15,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: ColorsConfig.colorBlack,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          isPriceVisible
              ? Text(
                  subText!,
                  style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: ColorsConfig.colorBlack,
                  ),
                )
              : Container(),
        ],
      )
    ],
  );
}