import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class ExpertReportTileWidget extends StatelessWidget {
  const ExpertReportTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 2.0,
                ),
              ),
              child: Image.asset(
                ImagePath.docIcon,
                height: 50,
                width: 50,
              )),
          const SizedBox(
            width: 8,
          ),
          const VerticalDivider(thickness: 2, color: ColorsConfig.colorGreyy),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Report',
                style: TextStyle(
                    fontFamily: AppTextStyle.microsoftJhengHei,
                    fontSize: 18.0,
                    color: ColorsConfig.colorGreyy,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '10/06/2022',
                style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 16.0,
                  color: ColorsConfig.colorGreyy,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: ColorsConfig.colorBlue,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              'view',
              style: TextStyle(
                  fontFamily: AppTextStyle.microsoftJhengHei,
                  fontSize: 15.0,
                  color: ColorsConfig.colorWhite,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
