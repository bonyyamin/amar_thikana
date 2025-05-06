// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(
  Map<String, dynamic> json,
) => _$MessageImpl(
  id: json['id'] as String,
  conversationId: json['conversationId'] as String,
  senderId: json['senderId'] as String,
  senderName: json['senderName'] as String,
  senderPhotoUrl: json['senderPhotoUrl'] as String?,
  type: $enumDecode(_$MessageTypeEnumMap, json['type']),
  content: json['content'] as String,
  imageUrls:
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList(),
  locationData: json['locationData'] as Map<String, dynamic>?,
  propertyId: json['propertyId'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
  readStatus: Map<String, bool>.from(json['readStatus'] as Map),
  recipients:
      (json['recipients'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderPhotoUrl': instance.senderPhotoUrl,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'content': instance.content,
      'imageUrls': instance.imageUrls,
      'locationData': instance.locationData,
      'propertyId': instance.propertyId,
      'timestamp': instance.timestamp.toIso8601String(),
      'readStatus': instance.readStatus,
      'recipients': instance.recipients,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.location: 'location',
  MessageType.propertyLink: 'propertyLink',
};
