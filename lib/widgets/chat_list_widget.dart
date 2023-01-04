import 'package:flutter/material.dart';

import '../model/model.dart';
import 'widgets.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({
    Key? key,
    required this.messages,
    required this.loadingValue,
    required this.scrollControl,
    required this.listNotFound,
  }) : super(key: key);

  final List<GetExpertMsg> messages;
  final bool loadingValue;
  final List listNotFound;
  final ScrollController scrollControl;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: loadingValue
            ? const MyndroLoader()
            : listNotFound.isEmpty
                ? const Center(
                    child: Text('Start Chatting'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (context, index) {
                      return ChatItemWidget(
                        msg: messages[index].chatMessagesText ?? '',
                        textAlign: messages[index].messageDirection ?? '',
                      );
                    },
                    itemCount: messages.length,
                    controller: scrollControl,
                  ));
  }
}
