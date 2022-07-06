import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant/constant.dart';

class ExpertProfileCard extends StatelessWidget {
  const ExpertProfileCard({Key? key, this.text, this.subText, this.exp})
      : super(key: key);
  final String? text;
  final String? subText;
  final int? exp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: ColorsConfig.colorLightGrey,
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        border: Border.all(
          color: Colors.transparent,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                    height: 5,
                  ),
                  RatingBar.builder(
                    itemSize: 18,
                    initialRating: 3,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    // itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: ColorsConfig.colorBlue,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text!,
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: ColorsConfig.colorBlue,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      subText!,
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.colorGreyy,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      subText!,
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.colorGreyy,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Exp: $exp',
                      style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.colorGreyy,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(child: textContainer('Appointment')),
              const SizedBox(
                width: 15,
              ),
              Expanded(child: textContainer('Instant Connect')),
            ],
          )
        ],
      ),
    );
  }
}

Widget textContainer(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(
        Radius.circular(30.0),
      ),
      border: Border.all(
        color: ColorsConfig.colorBlue,
        style: BorderStyle.solid,
        width: 1.0,
      ),
    ),
    child: Center(
        child: Text(
      text,
      style: TextStyle(
        fontFamily: AppTextStyle.microsoftJhengHei,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        color: ColorsConfig.colorBlue,
      ),
    )),
  );
}
