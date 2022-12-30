import 'package:flutter/material.dart';

import '../constant/constant.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({Key? key, this.onSend, required this.msgController})
      : super(key: key);
  final VoidCallback? onSend;
  final TextEditingController msgController;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              /*   IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.camera_alt_rounded),
                color: ColorsConfig.colorBlue,
                onPressed: () {},
              ), */
            ],
          ),

          // Text input
          Flexible(
            child: TextField(
              style: TextStyle(
                color: ColorsConfig.colorBlack,
                fontSize: 16,
                fontFamily: AppTextStyle.microsoftJhengHei,
              ),
              controller: msgController,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message',
                hintStyle: TextStyle(
                  color: ColorsConfig.colorBlack,
                  fontSize: 16,
                  fontFamily: AppTextStyle.microsoftJhengHei,
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: onSend,
                color: ColorsConfig.colorBlue,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: ColorsConfig.colorGreyy, width: 0.5)),
          color: Colors.white),
    );
  }
}
