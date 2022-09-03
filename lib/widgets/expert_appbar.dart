import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class ExpertAppbar extends StatelessWidget {
  const ExpertAppbar(
      {Key? key, this.text, this.onDrawerClick, this.leadingIcon})
      : super(key: key);

  final String? text;
  final VoidCallback? onDrawerClick;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
      color: ColorsConfig.colorBlue,
      child: Row(
        children: [
          IconButton(
              onPressed: onDrawerClick,
              icon: Icon(
                leadingIcon,
                color: ColorsConfig.colorWhite,
                size: 30,
              )),
          Text(
            text!,
            style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: ColorsConfig.colorWhite,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ClipOval(
              child: Material(
                color: ColorsConfig.colorBlue,
                child: GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                      height: 52,
                      width: 35,
                      child: Icon(
                        Icons.notifications,
                        color: ColorsConfig.colorWhite,
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
