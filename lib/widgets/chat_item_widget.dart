import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';

import 'package:get/get.dart';
import 'package:myndro/constant/colors_config.dart';

class ChatItemWidget extends StatelessWidget {
  var index;

  ChatItemWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index % 2 == 0) {
      //This is the sent message. We'll later use data from firebase instead of index to determine the message is sent or received.
      return ChatBubble(
        clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 20),
        backGroundColor: ColorsConfig.colorBlue,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.7,
          ),
          child: const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(color: Colors.white),
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
          child: const Text(
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

      /* Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: const Text(
                    'This is a received message',
                    style: TextStyle(color: Colors.orange),
                  ),
                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.0)),
                  margin: const EdgeInsets.only(left: 10.0),
                )
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: const EdgeInsets.only(bottom: 10.0),
      ); */
    }
  }
}
