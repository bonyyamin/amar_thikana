import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum MessageType {
  text,
  image,
  location,
  propertyLink,
}

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String conversationId,
    required String senderId,
    required String senderName,
    String? senderPhotoUrl,
    required MessageType type,
    required String content,
    List<String>? imageUrls,
    Map<String, dynamic>? locationData,
    String? propertyId,
    required DateTime timestamp,
    required Map<String, bool> readStatus, // Map of user IDs to read status
    List<String>? recipients, // List of recipient user IDs
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}