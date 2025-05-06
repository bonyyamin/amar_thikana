// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return _Conversation.fromJson(json);
}

/// @nodoc
mixin _$Conversation {
  String get id => throw _privateConstructorUsedError;
  List<String> get participants =>
      throw _privateConstructorUsedError; // List of user IDs
  Map<String, String> get participantNames =>
      throw _privateConstructorUsedError; // Map of user IDs to names
  Map<String, String>? get participantPhotos =>
      throw _privateConstructorUsedError; // Map of user IDs to photo URLs
  String get lastMessageText => throw _privateConstructorUsedError;
  DateTime get lastMessageTime => throw _privateConstructorUsedError;
  Map<String, bool> get unreadStatus =>
      throw _privateConstructorUsedError; // Map of user IDs to unread status
  String? get propertyId =>
      throw _privateConstructorUsedError; // Optional reference to a property if conversation is about a specific property
  List<Message> get messages => throw _privateConstructorUsedError;

  /// Serializes this Conversation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationCopyWith<Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
    Conversation value,
    $Res Function(Conversation) then,
  ) = _$ConversationCopyWithImpl<$Res, Conversation>;
  @useResult
  $Res call({
    String id,
    List<String> participants,
    Map<String, String> participantNames,
    Map<String, String>? participantPhotos,
    String lastMessageText,
    DateTime lastMessageTime,
    Map<String, bool> unreadStatus,
    String? propertyId,
    List<Message> messages,
  });
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res, $Val extends Conversation>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participants = null,
    Object? participantNames = null,
    Object? participantPhotos = freezed,
    Object? lastMessageText = null,
    Object? lastMessageTime = null,
    Object? unreadStatus = null,
    Object? propertyId = freezed,
    Object? messages = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            participants:
                null == participants
                    ? _value.participants
                    : participants // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            participantNames:
                null == participantNames
                    ? _value.participantNames
                    : participantNames // ignore: cast_nullable_to_non_nullable
                        as Map<String, String>,
            participantPhotos:
                freezed == participantPhotos
                    ? _value.participantPhotos
                    : participantPhotos // ignore: cast_nullable_to_non_nullable
                        as Map<String, String>?,
            lastMessageText:
                null == lastMessageText
                    ? _value.lastMessageText
                    : lastMessageText // ignore: cast_nullable_to_non_nullable
                        as String,
            lastMessageTime:
                null == lastMessageTime
                    ? _value.lastMessageTime
                    : lastMessageTime // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            unreadStatus:
                null == unreadStatus
                    ? _value.unreadStatus
                    : unreadStatus // ignore: cast_nullable_to_non_nullable
                        as Map<String, bool>,
            propertyId:
                freezed == propertyId
                    ? _value.propertyId
                    : propertyId // ignore: cast_nullable_to_non_nullable
                        as String?,
            messages:
                null == messages
                    ? _value.messages
                    : messages // ignore: cast_nullable_to_non_nullable
                        as List<Message>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConversationImplCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$$ConversationImplCopyWith(
    _$ConversationImpl value,
    $Res Function(_$ConversationImpl) then,
  ) = __$$ConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    List<String> participants,
    Map<String, String> participantNames,
    Map<String, String>? participantPhotos,
    String lastMessageText,
    DateTime lastMessageTime,
    Map<String, bool> unreadStatus,
    String? propertyId,
    List<Message> messages,
  });
}

/// @nodoc
class __$$ConversationImplCopyWithImpl<$Res>
    extends _$ConversationCopyWithImpl<$Res, _$ConversationImpl>
    implements _$$ConversationImplCopyWith<$Res> {
  __$$ConversationImplCopyWithImpl(
    _$ConversationImpl _value,
    $Res Function(_$ConversationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participants = null,
    Object? participantNames = null,
    Object? participantPhotos = freezed,
    Object? lastMessageText = null,
    Object? lastMessageTime = null,
    Object? unreadStatus = null,
    Object? propertyId = freezed,
    Object? messages = null,
  }) {
    return _then(
      _$ConversationImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        participants:
            null == participants
                ? _value._participants
                : participants // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        participantNames:
            null == participantNames
                ? _value._participantNames
                : participantNames // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
        participantPhotos:
            freezed == participantPhotos
                ? _value._participantPhotos
                : participantPhotos // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>?,
        lastMessageText:
            null == lastMessageText
                ? _value.lastMessageText
                : lastMessageText // ignore: cast_nullable_to_non_nullable
                    as String,
        lastMessageTime:
            null == lastMessageTime
                ? _value.lastMessageTime
                : lastMessageTime // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        unreadStatus:
            null == unreadStatus
                ? _value._unreadStatus
                : unreadStatus // ignore: cast_nullable_to_non_nullable
                    as Map<String, bool>,
        propertyId:
            freezed == propertyId
                ? _value.propertyId
                : propertyId // ignore: cast_nullable_to_non_nullable
                    as String?,
        messages:
            null == messages
                ? _value._messages
                : messages // ignore: cast_nullable_to_non_nullable
                    as List<Message>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationImpl implements _Conversation {
  const _$ConversationImpl({
    required this.id,
    required final List<String> participants,
    required final Map<String, String> participantNames,
    final Map<String, String>? participantPhotos,
    required this.lastMessageText,
    required this.lastMessageTime,
    required final Map<String, bool> unreadStatus,
    this.propertyId,
    final List<Message> messages = const [],
  }) : _participants = participants,
       _participantNames = participantNames,
       _participantPhotos = participantPhotos,
       _unreadStatus = unreadStatus,
       _messages = messages;

  factory _$ConversationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationImplFromJson(json);

  @override
  final String id;
  final List<String> _participants;
  @override
  List<String> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  // List of user IDs
  final Map<String, String> _participantNames;
  // List of user IDs
  @override
  Map<String, String> get participantNames {
    if (_participantNames is EqualUnmodifiableMapView) return _participantNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantNames);
  }

  // Map of user IDs to names
  final Map<String, String>? _participantPhotos;
  // Map of user IDs to names
  @override
  Map<String, String>? get participantPhotos {
    final value = _participantPhotos;
    if (value == null) return null;
    if (_participantPhotos is EqualUnmodifiableMapView)
      return _participantPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  // Map of user IDs to photo URLs
  @override
  final String lastMessageText;
  @override
  final DateTime lastMessageTime;
  final Map<String, bool> _unreadStatus;
  @override
  Map<String, bool> get unreadStatus {
    if (_unreadStatus is EqualUnmodifiableMapView) return _unreadStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_unreadStatus);
  }

  // Map of user IDs to unread status
  @override
  final String? propertyId;
  // Optional reference to a property if conversation is about a specific property
  final List<Message> _messages;
  // Optional reference to a property if conversation is about a specific property
  @override
  @JsonKey()
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'Conversation(id: $id, participants: $participants, participantNames: $participantNames, participantPhotos: $participantPhotos, lastMessageText: $lastMessageText, lastMessageTime: $lastMessageTime, unreadStatus: $unreadStatus, propertyId: $propertyId, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ) &&
            const DeepCollectionEquality().equals(
              other._participantNames,
              _participantNames,
            ) &&
            const DeepCollectionEquality().equals(
              other._participantPhotos,
              _participantPhotos,
            ) &&
            (identical(other.lastMessageText, lastMessageText) ||
                other.lastMessageText == lastMessageText) &&
            (identical(other.lastMessageTime, lastMessageTime) ||
                other.lastMessageTime == lastMessageTime) &&
            const DeepCollectionEquality().equals(
              other._unreadStatus,
              _unreadStatus,
            ) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_participants),
    const DeepCollectionEquality().hash(_participantNames),
    const DeepCollectionEquality().hash(_participantPhotos),
    lastMessageText,
    lastMessageTime,
    const DeepCollectionEquality().hash(_unreadStatus),
    propertyId,
    const DeepCollectionEquality().hash(_messages),
  );

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationImplCopyWith<_$ConversationImpl> get copyWith =>
      __$$ConversationImplCopyWithImpl<_$ConversationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationImplToJson(this);
  }
}

abstract class _Conversation implements Conversation {
  const factory _Conversation({
    required final String id,
    required final List<String> participants,
    required final Map<String, String> participantNames,
    final Map<String, String>? participantPhotos,
    required final String lastMessageText,
    required final DateTime lastMessageTime,
    required final Map<String, bool> unreadStatus,
    final String? propertyId,
    final List<Message> messages,
  }) = _$ConversationImpl;

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$ConversationImpl.fromJson;

  @override
  String get id;
  @override
  List<String> get participants; // List of user IDs
  @override
  Map<String, String> get participantNames; // Map of user IDs to names
  @override
  Map<String, String>? get participantPhotos; // Map of user IDs to photo URLs
  @override
  String get lastMessageText;
  @override
  DateTime get lastMessageTime;
  @override
  Map<String, bool> get unreadStatus; // Map of user IDs to unread status
  @override
  String? get propertyId; // Optional reference to a property if conversation is about a specific property
  @override
  List<Message> get messages;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationImplCopyWith<_$ConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
