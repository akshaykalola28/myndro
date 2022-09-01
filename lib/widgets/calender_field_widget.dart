import 'package:flutter/material.dart';

import '../constant/constant.dart';

class DateTimeFieldWidget extends StatelessWidget {
  const DateTimeFieldWidget(
      {Key? key, this.dateText, this.onClick, this.isTime = false})
      : super(key: key);
  final String? dateText;
  final VoidCallback? onClick;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        // width: Get.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: ColorsConfig.colorGreyy,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateText!,
              style: TextStyle(
                fontFamily: AppTextStyle.microsoftJhengHei,
                fontSize: 18.0,
                color: ColorsConfig.colorGreyy,
              ),
            ),
            Icon(
              isTime ? Icons.access_time_rounded : Icons.calendar_month,
              color: ColorsConfig.colorGreyy,
            )
          ],
        ),
      ),
    );
  }
}
