import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: ColorsConfig.colorBlue,
                          border: Border.all(color: ColorsConfig.colorBlue),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(50))),
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
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(50))),
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
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: ColorsConfig.colorGreyy,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'dcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskfdcdcdcdcdsfrrmdkfjdkfndksfndsknfkdsnfksdnfkdsnfksnfksnfskfnskf',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'D.O.B',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                            Text(
                              'data',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sex',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                            Text(
                              'data',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                            Text(
                              'data',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Height',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                            Text(
                              'data',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Appointment',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                            Text(
                              'data',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Register Date',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                            Text(
                              'data',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w400,
                                color: ColorsConfig.colorGreyy,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, i) {
                        return Row(
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: BoxDecoration(
                                    color: ColorsConfig.colorPurple
                                        .withOpacity(0.2),
                                    border:
                                        Border.all(color: Colors.transparent),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25))),
                                child: Text(
                                  'anxiety',
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                    color: ColorsConfig.colorPurple,
                                  ),
                                )),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                                color: ColorsConfig.colorBlue,
                                border: Border.all(color: Colors.transparent),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25))),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 13,
                                  color: ColorsConfig.colorWhite,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '+91 0123456789',
                                  style: TextStyle(
                                    fontFamily: AppTextStyle.microsoftJhengHei,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                    color: ColorsConfig.colorWhite,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: ColorsConfig.colorGreyy),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.folder_open_outlined,
                                size: 13,
                                color: ColorsConfig.colorGreyy,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Docs',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsConfig.colorGreyy,
                                ),
                              ),
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: ColorsConfig.colorGreyy),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                size: 13,
                                color: ColorsConfig.colorGreyy,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'chat',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsConfig.colorGreyy,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
