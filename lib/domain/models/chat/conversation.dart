import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required List<String> participants, // List of user IDs
    required Map<String, String> participantNames, // Map of user IDs to names
    Map<String, String>? participantPhotos, // Map of user IDs to photo URLs
    required String lastMessageText,
    required DateTime lastMessageTime,
    required Map<String, bool> unreadStatus, // Map of user IDs to unread status
    String? propertyId, // Optional reference to a property if conversation is about a specific property
    @Default([]) List<Message> messages, // Optional list of messages (might be loaded separately)
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
}