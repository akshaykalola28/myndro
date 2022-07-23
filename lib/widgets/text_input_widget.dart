import 'package:flutter/material.dart';

import '../constant/constant.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  InputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.camera_alt_rounded),
                color: ColorsConfig.colorBlue,
                onPressed: () {},
              ),
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
              controller: textEditingController,
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
                onPressed: () => {},
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
