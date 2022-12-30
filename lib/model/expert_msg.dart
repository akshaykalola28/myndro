class ExpertMsg {
  String? msg;
  String? type;
  List<GetExpertMsg>? data;

  ExpertMsg({this.msg, this.type, this.data});

  ExpertMsg.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    type = json['type'];
    if (json['data'] != null) {
      data = <GetExpertMsg>[];
      json['data'].forEach((v) {
        data!.add(GetExpertMsg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetExpertMsg {
  String? chatMessagesText;
  String? chatMessagesDatetime;
  String? messageDirection;

  GetExpertMsg(
      {this.chatMessagesText,
      this.chatMessagesDatetime,
      this.messageDirection});

  GetExpertMsg.fromJson(Map<String, dynamic> json) {
    chatMessagesText = json['chat_messages_text'];
    chatMessagesDatetime = json['chat_messages_datetime'];
    messageDirection = json['message_direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_messages_text'] = chatMessagesText;
    data['chat_messages_datetime'] = chatMessagesDatetime;
    data['message_direction'] = messageDirection;
    return data;
  }
}
