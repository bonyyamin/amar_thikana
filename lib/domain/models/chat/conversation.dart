import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required String userId,
    required String userName,
    required String userProfileImage,
    required List<Message> messages,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
}
