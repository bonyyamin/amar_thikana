// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_rules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PropertyRules _$PropertyRulesFromJson(Map<String, dynamic> json) {
  return _PropertyRules.fromJson(json);
}

/// @nodoc
mixin _$PropertyRules {
  String get genderPreference =>
      throw _privateConstructorUsedError; // "male", "female", "family", "any"
  bool get smokingAllowed => throw _privateConstructorUsedError;
  bool get petsAllowed => throw _privateConstructorUsedError;
  String get guestPolicy =>
      throw _privateConstructorUsedError; // "allowed", "restricted", "not_allowed"
  String? get additionalRules => throw _privateConstructorUsedError;

  /// Serializes this PropertyRules to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyRulesCopyWith<PropertyRules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyRulesCopyWith<$Res> {
  factory $PropertyRulesCopyWith(
    PropertyRules value,
    $Res Function(PropertyRules) then,
  ) = _$PropertyRulesCopyWithImpl<$Res, PropertyRules>;
  @useResult
  $Res call({
    String genderPreference,
    bool smokingAllowed,
    bool petsAllowed,
    String guestPolicy,
    String? additionalRules,
  });
}

/// @nodoc
class _$PropertyRulesCopyWithImpl<$Res, $Val extends PropertyRules>
    implements $PropertyRulesCopyWith<$Res> {
  _$PropertyRulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderPreference = null,
    Object? smokingAllowed = null,
    Object? petsAllowed = null,
    Object? guestPolicy = null,
    Object? additionalRules = freezed,
  }) {
    return _then(
      _value.copyWith(
            genderPreference:
                null == genderPreference
                    ? _value.genderPreference
                    : genderPreference // ignore: cast_nullable_to_non_nullable
                        as String,
            smokingAllowed:
                null == smokingAllowed
                    ? _value.smokingAllowed
                    : smokingAllowed // ignore: cast_nullable_to_non_nullable
                        as bool,
            petsAllowed:
                null == petsAllowed
                    ? _value.petsAllowed
                    : petsAllowed // ignore: cast_nullable_to_non_nullable
                        as bool,
            guestPolicy:
                null == guestPolicy
                    ? _value.guestPolicy
                    : guestPolicy // ignore: cast_nullable_to_non_nullable
                        as String,
            additionalRules:
                freezed == additionalRules
                    ? _value.additionalRules
                    : additionalRules // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PropertyRulesImplCopyWith<$Res>
    implements $PropertyRulesCopyWith<$Res> {
  factory _$$PropertyRulesImplCopyWith(
    _$PropertyRulesImpl value,
    $Res Function(_$PropertyRulesImpl) then,
  ) = __$$PropertyRulesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String genderPreference,
    bool smokingAllowed,
    bool petsAllowed,
    String guestPolicy,
    String? additionalRules,
  });
}

/// @nodoc
class __$$PropertyRulesImplCopyWithImpl<$Res>
    extends _$PropertyRulesCopyWithImpl<$Res, _$PropertyRulesImpl>
    implements _$$PropertyRulesImplCopyWith<$Res> {
  __$$PropertyRulesImplCopyWithImpl(
    _$PropertyRulesImpl _value,
    $Res Function(_$PropertyRulesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PropertyRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderPreference = null,
    Object? smokingAllowed = null,
    Object? petsAllowed = null,
    Object? guestPolicy = null,
    Object? additionalRules = freezed,
  }) {
    return _then(
      _$PropertyRulesImpl(
        genderPreference:
            null == genderPreference
                ? _value.genderPreference
                : genderPreference // ignore: cast_nullable_to_non_nullable
                    as String,
        smokingAllowed:
            null == smokingAllowed
                ? _value.smokingAllowed
                : smokingAllowed // ignore: cast_nullable_to_non_nullable
                    as bool,
        petsAllowed:
            null == petsAllowed
                ? _value.petsAllowed
                : petsAllowed // ignore: cast_nullable_to_non_nullable
                    as bool,
        guestPolicy:
            null == guestPolicy
                ? _value.guestPolicy
                : guestPolicy // ignore: cast_nullable_to_non_nullable
                    as String,
        additionalRules:
            freezed == additionalRules
                ? _value.additionalRules
                : additionalRules // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyRulesImpl implements _PropertyRules {
  const _$PropertyRulesImpl({
    required this.genderPreference,
    required this.smokingAllowed,
    required this.petsAllowed,
    required this.guestPolicy,
    this.additionalRules,
  });

  factory _$PropertyRulesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyRulesImplFromJson(json);

  @override
  final String genderPreference;
  // "male", "female", "family", "any"
  @override
  final bool smokingAllowed;
  @override
  final bool petsAllowed;
  @override
  final String guestPolicy;
  // "allowed", "restricted", "not_allowed"
  @override
  final String? additionalRules;

  @override
  String toString() {
    return 'PropertyRules(genderPreference: $genderPreference, smokingAllowed: $smokingAllowed, petsAllowed: $petsAllowed, guestPolicy: $guestPolicy, additionalRules: $additionalRules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyRulesImpl &&
            (identical(other.genderPreference, genderPreference) ||
                other.genderPreference == genderPreference) &&
            (identical(other.smokingAllowed, smokingAllowed) ||
                other.smokingAllowed == smokingAllowed) &&
            (identical(other.petsAllowed, petsAllowed) ||
                other.petsAllowed == petsAllowed) &&
            (identical(other.guestPolicy, guestPolicy) ||
                other.guestPolicy == guestPolicy) &&
            (identical(other.additionalRules, additionalRules) ||
                other.additionalRules == additionalRules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    genderPreference,
    smokingAllowed,
    petsAllowed,
    guestPolicy,
    additionalRules,
  );

  /// Create a copy of PropertyRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyRulesImplCopyWith<_$PropertyRulesImpl> get copyWith =>
      __$$PropertyRulesImplCopyWithImpl<_$PropertyRulesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyRulesImplToJson(this);
  }
}

abstract class _PropertyRules implements PropertyRules {
  const factory _PropertyRules({
    required final String genderPreference,
    required final bool smokingAllowed,
    required final bool petsAllowed,
    required final String guestPolicy,
    final String? additionalRules,
  }) = _$PropertyRulesImpl;

  factory _PropertyRules.fromJson(Map<String, dynamic> json) =
      _$PropertyRulesImpl.fromJson;

  @override
  String get genderPreference; // "male", "female", "family", "any"
  @override
  bool get smokingAllowed;
  @override
  bool get petsAllowed;
  @override
  String get guestPolicy; // "allowed", "restricted", "not_allowed"
  @override
  String? get additionalRules;

  /// Create a copy of PropertyRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyRulesImplCopyWith<_$PropertyRulesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
