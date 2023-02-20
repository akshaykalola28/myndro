import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class UserAppbar extends StatelessWidget {
  UserAppbar({Key? key, this.text, this.isAssessment, this.isAssessBack})
      : super(key: key);

  final String? text;
  bool? isAssessment = false;
  final VoidCallback? isAssessBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
      color: ColorsConfig.colorGrey,
      child: Row(
        children: [
          if (isAssessment == true)
            IconButton(
                onPressed: isAssessBack,
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorsConfig.colorBlue,
                  size: 30,
                ))
          else
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorsConfig.colorBlue,
                  size: 30,
                )),
          Text(
            text!,
            style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: ColorsConfig.colorBlue,
            ),
          ),
          const Spacer(),
          if (isAssessment == true)
            Container()
          else
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ClipOval(
                child: Material(
                  color: ColorsConfig.colorWhite,
                  child: GestureDetector(
                    onTap: () {},
                    child: const SizedBox(
                        height: 52,
                        width: 35,
                        child: Icon(
                          Icons.notifications,
                          color: ColorsConfig.colorBlue,
                        )),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
