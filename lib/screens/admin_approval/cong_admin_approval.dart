import 'package:flutter/material.dart';
import 'package:myndro/constant/constant.dart';

class CongAdminApproval extends StatefulWidget {
  static const pageId = "/congratulationScreen";
  const CongAdminApproval({Key? key}) : super(key: key);

  @override
  State<CongAdminApproval> createState() => _CongAdminApprovalState();
}

class _CongAdminApprovalState extends State<CongAdminApproval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      body: SafeArea(
        child: Image.asset(ImagePath.congScreen,fit: BoxFit.contain,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,),
      ),
    );
  }
}
