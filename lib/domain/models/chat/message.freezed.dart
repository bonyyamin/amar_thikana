// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  String get conversationId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String? get senderPhotoUrl => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String>? get imageUrls => throw _privateConstructorUsedError;
  Map<String, dynamic>? get locationData => throw _privateConstructorUsedError;
  String? get propertyId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  Map<String, bool> get readStatus =>
      throw _privateConstructorUsedError; // Map of user IDs to read status
  List<String>? get recipients => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({
    String id,
    String conversationId,
    String senderId,
    String senderName,
    String? senderPhotoUrl,
    MessageType type,
    String content,
    List<String>? imageUrls,
    Map<String, dynamic>? locationData,
    String? propertyId,
    DateTime timestamp,
    Map<String, bool> readStatus,
    List<String>? recipients,
  });
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? conversationId = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderPhotoUrl = freezed,
    Object? type = null,
    Object? content = null,
    Object? imageUrls = freezed,
    Object? locationData = freezed,
    Object? propertyId = freezed,
    Object? timestamp = null,
    Object? readStatus = null,
    Object? recipients = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            conversationId:
                null == conversationId
                    ? _value.conversationId
                    : conversationId // ignore: cast_nullable_to_non_nullable
                        as String,
            senderId:
                null == senderId
                    ? _value.senderId
                    : senderId // ignore: cast_nullable_to_non_nullable
                        as String,
            senderName:
                null == senderName
                    ? _value.senderName
                    : senderName // ignore: cast_nullable_to_non_nullable
                        as String,
            senderPhotoUrl:
                freezed == senderPhotoUrl
                    ? _value.senderPhotoUrl
                    : senderPhotoUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as MessageType,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrls:
                freezed == imageUrls
                    ? _value.imageUrls
                    : imageUrls // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            locationData:
                freezed == locationData
                    ? _value.locationData
                    : locationData // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>?,
            propertyId:
                freezed == propertyId
                    ? _value.propertyId
                    : propertyId // ignore: cast_nullable_to_non_nullable
                        as String?,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            readStatus:
                null == readStatus
                    ? _value.readStatus
                    : readStatus // ignore: cast_nullable_to_non_nullable
                        as Map<String, bool>,
            recipients:
                freezed == recipients
                    ? _value.recipients
                    : recipients // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
    _$MessageImpl value,
    $Res Function(_$MessageImpl) then,
  ) = __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String conversationId,
    String senderId,
    String senderName,
    String? senderPhotoUrl,
    MessageType type,
    String content,
    List<String>? imageUrls,
    Map<String, dynamic>? locationData,
    String? propertyId,
    DateTime timestamp,
    Map<String, bool> readStatus,
    List<String>? recipients,
  });
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
    _$MessageImpl _value,
    $Res Function(_$MessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? conversationId = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderPhotoUrl = freezed,
    Object? type = null,
    Object? content = null,
    Object? imageUrls = freezed,
    Object? locationData = freezed,
    Object? propertyId = freezed,
    Object? timestamp = null,
    Object? readStatus = null,
    Object? recipients = freezed,
  }) {
    return _then(
      _$MessageImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        conversationId:
            null == conversationId
                ? _value.conversationId
                : conversationId // ignore: cast_nullable_to_non_nullable
                    as String,
        senderId:
            null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                    as String,
        senderName:
            null == senderName
                ? _value.senderName
                : senderName // ignore: cast_nullable_to_non_nullable
                    as String,
        senderPhotoUrl:
            freezed == senderPhotoUrl
                ? _value.senderPhotoUrl
                : senderPhotoUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as MessageType,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrls:
            freezed == imageUrls
                ? _value._imageUrls
                : imageUrls // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        locationData:
            freezed == locationData
                ? _value._locationData
                : locationData // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>?,
        propertyId:
            freezed == propertyId
                ? _value.propertyId
                : propertyId // ignore: cast_nullable_to_non_nullable
                    as String?,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        readStatus:
            null == readStatus
                ? _value._readStatus
                : readStatus // ignore: cast_nullable_to_non_nullable
                    as Map<String, bool>,
        recipients:
            freezed == recipients
                ? _value._recipients
                : recipients // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.senderName,
    this.senderPhotoUrl,
    required this.type,
    required this.content,
    final List<String>? imageUrls,
    final Map<String, dynamic>? locationData,
    this.propertyId,
    required this.timestamp,
    required final Map<String, bool> readStatus,
    final List<String>? recipients,
  }) : _imageUrls = imageUrls,
       _locationData = locationData,
       _readStatus = readStatus,
       _recipients = recipients;

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String id;
  @override
  final String conversationId;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderPhotoUrl;
  @override
  final MessageType type;
  @override
  final String content;
  final List<String>? _imageUrls;
  @override
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _locationData;
  @override
  Map<String, dynamic>? get locationData {
    final value = _locationData;
    if (value == null) return null;
    if (_locationData is EqualUnmodifiableMapView) return _locationData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? propertyId;
  @override
  final DateTime timestamp;
  final Map<String, bool> _readStatus;
  @override
  Map<String, bool> get readStatus {
    if (_readStatus is EqualUnmodifiableMapView) return _readStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_readStatus);
  }

  // Map of user IDs to read status
  final List<String>? _recipients;
  // Map of user IDs to read status
  @override
  List<String>? get recipients {
    final value = _recipients;
    if (value == null) return null;
    if (_recipients is EqualUnmodifiableListView) return _recipients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Message(id: $id, conversationId: $conversationId, senderId: $senderId, senderName: $senderName, senderPhotoUrl: $senderPhotoUrl, type: $type, content: $content, imageUrls: $imageUrls, locationData: $locationData, propertyId: $propertyId, timestamp: $timestamp, readStatus: $readStatus, recipients: $recipients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderPhotoUrl, senderPhotoUrl) ||
                other.senderPhotoUrl == senderPhotoUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(
              other._imageUrls,
              _imageUrls,
            ) &&
            const DeepCollectionEquality().equals(
              other._locationData,
              _locationData,
            ) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(
              other._readStatus,
              _readStatus,
            ) &&
            const DeepCollectionEquality().equals(
              other._recipients,
              _recipients,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    conversationId,
    senderId,
    senderName,
    senderPhotoUrl,
    type,
    content,
    const DeepCollectionEquality().hash(_imageUrls),
    const DeepCollectionEquality().hash(_locationData),
    propertyId,
    timestamp,
    const DeepCollectionEquality().hash(_readStatus),
    const DeepCollectionEquality().hash(_recipients),
  );

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message({
    required final String id,
    required final String conversationId,
    required final String senderId,
    required final String senderName,
    final String? senderPhotoUrl,
    required final MessageType type,
    required final String content,
    final List<String>? imageUrls,
    final Map<String, dynamic>? locationData,
    final String? propertyId,
    required final DateTime timestamp,
    required final Map<String, bool> readStatus,
    final List<String>? recipients,
  }) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get id;
  @override
  String get conversationId;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderPhotoUrl;
  @override
  MessageType get type;
  @override
  String get content;
  @override
  List<String>? get imageUrls;
  @override
  Map<String, dynamic>? get locationData;
  @override
  String? get propertyId;
  @override
  DateTime get timestamp;
  @override
  Map<String, bool> get readStatus; // Map of user IDs to read status
  @override
  List<String>? get recipients;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
