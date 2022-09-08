import 'package:flutter/material.dart';

import 'controller.dart';

class MyndroLockerController extends BaseController {
  @override
  void errorHandler(e) {}

  showPopupMenu(BuildContext context, Offset offset) {
    double left = offset.dx;
    double top = offset.dy;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        const PopupMenuItem<String>(
          value: '1',
          child: Text('Share view'),
        ),
      ],
      elevation: 8.0,
    );
  }
}
