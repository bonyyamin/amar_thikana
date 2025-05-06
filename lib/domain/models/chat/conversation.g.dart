// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationImpl _$$ConversationImplFromJson(
  Map<String, dynamic> json,
) => _$ConversationImpl(
  id: json['id'] as String,
  participants:
      (json['participants'] as List<dynamic>).map((e) => e as String).toList(),
  participantNames: Map<String, String>.from(json['participantNames'] as Map),
  participantPhotos: (json['participantPhotos'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  lastMessageText: json['lastMessageText'] as String,
  lastMessageTime: DateTime.parse(json['lastMessageTime'] as String),
  unreadStatus: Map<String, bool>.from(json['unreadStatus'] as Map),
  propertyId: json['propertyId'] as String?,
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participants': instance.participants,
      'participantNames': instance.participantNames,
      'participantPhotos': instance.participantPhotos,
      'lastMessageText': instance.lastMessageText,
      'lastMessageTime': instance.lastMessageTime.toIso8601String(),
      'unreadStatus': instance.unreadStatus,
      'propertyId': instance.propertyId,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };
