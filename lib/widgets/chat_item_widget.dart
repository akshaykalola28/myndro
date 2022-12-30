import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';

import 'package:get/get.dart';
import 'package:myndro/constant/colors_config.dart';

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({Key? key, this.msg, this.textAlign}) : super(key: key);

  final String? msg;
  final String? textAlign;

  @override
  Widget build(BuildContext context) {
    if (textAlign == 'right') {
      return ChatBubble(
        clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 20),
        backGroundColor: ColorsConfig.colorBlue,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.7,
          ),
          child: Text(
            msg ?? '',
            softWrap: true,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      // This is a received message
      return ChatBubble(
        clipper: ChatBubbleClipper9(type: BubbleType.receiverBubble),
        backGroundColor: const Color(0xffE7E7ED),
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.7,
          ),
          child: Text(
            msg ?? '',
            softWrap: true,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      );
    }
  }
}
