// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_details_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PropertyDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  Property? get property => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of PropertyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyDetailsStateCopyWith<PropertyDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyDetailsStateCopyWith<$Res> {
  factory $PropertyDetailsStateCopyWith(
    PropertyDetailsState value,
    $Res Function(PropertyDetailsState) then,
  ) = _$PropertyDetailsStateCopyWithImpl<$Res, PropertyDetailsState>;
  @useResult
  $Res call({bool isLoading, Property? property, String errorMessage});

  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class _$PropertyDetailsStateCopyWithImpl<
  $Res,
  $Val extends PropertyDetailsState
>
    implements $PropertyDetailsStateCopyWith<$Res> {
  _$PropertyDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? property = freezed,
    Object? errorMessage = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            property:
                freezed == property
                    ? _value.property
                    : property // ignore: cast_nullable_to_non_nullable
                        as Property?,
            errorMessage:
                null == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of PropertyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyCopyWith<$Res>? get property {
    if (_value.property == null) {
      return null;
    }

    return $PropertyCopyWith<$Res>(_value.property!, (value) {
      return _then(_value.copyWith(property: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PropertyDetailsStateImplCopyWith<$Res>
    implements $PropertyDetailsStateCopyWith<$Res> {
  factory _$$PropertyDetailsStateImplCopyWith(
    _$PropertyDetailsStateImpl value,
    $Res Function(_$PropertyDetailsStateImpl) then,
  ) = __$$PropertyDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, Property? property, String errorMessage});

  @override
  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class __$$PropertyDetailsStateImplCopyWithImpl<$Res>
    extends _$PropertyDetailsStateCopyWithImpl<$Res, _$PropertyDetailsStateImpl>
    implements _$$PropertyDetailsStateImplCopyWith<$Res> {
  __$$PropertyDetailsStateImplCopyWithImpl(
    _$PropertyDetailsStateImpl _value,
    $Res Function(_$PropertyDetailsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PropertyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? property = freezed,
    Object? errorMessage = null,
  }) {
    return _then(
      _$PropertyDetailsStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        property:
            freezed == property
                ? _value.property
                : property // ignore: cast_nullable_to_non_nullable
                    as Property?,
        errorMessage:
            null == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PropertyDetailsStateImpl extends _PropertyDetailsState {
  const _$PropertyDetailsStateImpl({
    this.isLoading = false,
    this.property,
    this.errorMessage = '',
  }) : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Property? property;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'PropertyDetailsState(isLoading: $isLoading, property: $property, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, property, errorMessage);

  /// Create a copy of PropertyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyDetailsStateImplCopyWith<_$PropertyDetailsStateImpl>
  get copyWith =>
      __$$PropertyDetailsStateImplCopyWithImpl<_$PropertyDetailsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PropertyDetailsState extends PropertyDetailsState {
  const factory _PropertyDetailsState({
    final bool isLoading,
    final Property? property,
    final String errorMessage,
  }) = _$PropertyDetailsStateImpl;
  const _PropertyDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  Property? get property;
  @override
  String get errorMessage;

  /// Create a copy of PropertyDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyDetailsStateImplCopyWith<_$PropertyDetailsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
