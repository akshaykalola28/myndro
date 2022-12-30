import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../util/common.dart';

class AppointmentListWidget extends StatelessWidget {
  const AppointmentListWidget(
      {Key? key,
      this.userName,
      this.title,
      this.subTitle,
      this.time,
      this.onClick,
      this.caseNo})
      : super(key: key);
  final String? userName;
  final String? title;
  final String? subTitle;
  final String? time;
  final String? caseNo;
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      leading: CircleAvatar(
        maxRadius: 30,
        minRadius: 30,
        backgroundColor: ColorsConfig.colorBlue,
        child: Text(
            userName != null ? userName!.substring(0, 1).toUpperCase() : '',
            style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 18.0,
              color: ColorsConfig.colorWhite,
            )),
      ),
      title: Text(
        '${title ?? ''} (${caseNo ?? ''})',
        softWrap: true,
        style: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 18.0,
        ),
      ),
      subtitle: Text(
        'Appointment Date ',
        softWrap: true,
        style: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 16.0,
        ),
      ),
      trailing: Text(
        time ?? '',
        style: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
