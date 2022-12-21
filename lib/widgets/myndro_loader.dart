import 'package:flutter/material.dart';

import '../constant/constant.dart';

class MyndroLoader extends StatelessWidget {
  const MyndroLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: ColorsConfig.colorBlue),
    );
  }
}
