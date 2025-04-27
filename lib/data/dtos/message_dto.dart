import 'package:amar_thikana/domain/models/chat/message.dart';

class MessageDTO {
  static Message fromJson(Map<String, dynamic> json) => Message.fromJson(json);

  static Map<String, dynamic> toJson(Message message) => message.toJson();
}
