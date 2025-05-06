// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'landlord.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Landlord _$LandlordFromJson(Map<String, dynamic> json) {
  return _Landlord.fromJson(json);
}

/// @nodoc
mixin _$Landlord {
  String get verificationStatus =>
      throw _privateConstructorUsedError; // "pending", "verified", "rejected"
  String? get verificationDocumentUrl => throw _privateConstructorUsedError;
  double? get averageRating => throw _privateConstructorUsedError;
  int? get reviewCount => throw _privateConstructorUsedError;
  int? get totalProperties => throw _privateConstructorUsedError;
  int? get activeListings => throw _privateConstructorUsedError;
  bool? get isBusinessAccount => throw _privateConstructorUsedError;
  String? get businessName => throw _privateConstructorUsedError;
  String? get businessRegistrationNumber => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this Landlord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Landlord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LandlordCopyWith<Landlord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LandlordCopyWith<$Res> {
  factory $LandlordCopyWith(Landlord value, $Res Function(Landlord) then) =
      _$LandlordCopyWithImpl<$Res, Landlord>;
  @useResult
  $Res call({
    String verificationStatus,
    String? verificationDocumentUrl,
    double? averageRating,
    int? reviewCount,
    int? totalProperties,
    int? activeListings,
    bool? isBusinessAccount,
    String? businessName,
    String? businessRegistrationNumber,
    String? description,
  });
}

/// @nodoc
class _$LandlordCopyWithImpl<$Res, $Val extends Landlord>
    implements $LandlordCopyWith<$Res> {
  _$LandlordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Landlord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationStatus = null,
    Object? verificationDocumentUrl = freezed,
    Object? averageRating = freezed,
    Object? reviewCount = freezed,
    Object? totalProperties = freezed,
    Object? activeListings = freezed,
    Object? isBusinessAccount = freezed,
    Object? businessName = freezed,
    Object? businessRegistrationNumber = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            verificationStatus:
                null == verificationStatus
                    ? _value.verificationStatus
                    : verificationStatus // ignore: cast_nullable_to_non_nullable
                        as String,
            verificationDocumentUrl:
                freezed == verificationDocumentUrl
                    ? _value.verificationDocumentUrl
                    : verificationDocumentUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            averageRating:
                freezed == averageRating
                    ? _value.averageRating
                    : averageRating // ignore: cast_nullable_to_non_nullable
                        as double?,
            reviewCount:
                freezed == reviewCount
                    ? _value.reviewCount
                    : reviewCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalProperties:
                freezed == totalProperties
                    ? _value.totalProperties
                    : totalProperties // ignore: cast_nullable_to_non_nullable
                        as int?,
            activeListings:
                freezed == activeListings
                    ? _value.activeListings
                    : activeListings // ignore: cast_nullable_to_non_nullable
                        as int?,
            isBusinessAccount:
                freezed == isBusinessAccount
                    ? _value.isBusinessAccount
                    : isBusinessAccount // ignore: cast_nullable_to_non_nullable
                        as bool?,
            businessName:
                freezed == businessName
                    ? _value.businessName
                    : businessName // ignore: cast_nullable_to_non_nullable
                        as String?,
            businessRegistrationNumber:
                freezed == businessRegistrationNumber
                    ? _value.businessRegistrationNumber
                    : businessRegistrationNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LandlordImplCopyWith<$Res>
    implements $LandlordCopyWith<$Res> {
  factory _$$LandlordImplCopyWith(
    _$LandlordImpl value,
    $Res Function(_$LandlordImpl) then,
  ) = __$$LandlordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String verificationStatus,
    String? verificationDocumentUrl,
    double? averageRating,
    int? reviewCount,
    int? totalProperties,
    int? activeListings,
    bool? isBusinessAccount,
    String? businessName,
    String? businessRegistrationNumber,
    String? description,
  });
}

/// @nodoc
class __$$LandlordImplCopyWithImpl<$Res>
    extends _$LandlordCopyWithImpl<$Res, _$LandlordImpl>
    implements _$$LandlordImplCopyWith<$Res> {
  __$$LandlordImplCopyWithImpl(
    _$LandlordImpl _value,
    $Res Function(_$LandlordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Landlord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationStatus = null,
    Object? verificationDocumentUrl = freezed,
    Object? averageRating = freezed,
    Object? reviewCount = freezed,
    Object? totalProperties = freezed,
    Object? activeListings = freezed,
    Object? isBusinessAccount = freezed,
    Object? businessName = freezed,
    Object? businessRegistrationNumber = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$LandlordImpl(
        verificationStatus:
            null == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                    as String,
        verificationDocumentUrl:
            freezed == verificationDocumentUrl
                ? _value.verificationDocumentUrl
                : verificationDocumentUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        averageRating:
            freezed == averageRating
                ? _value.averageRating
                : averageRating // ignore: cast_nullable_to_non_nullable
                    as double?,
        reviewCount:
            freezed == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalProperties:
            freezed == totalProperties
                ? _value.totalProperties
                : totalProperties // ignore: cast_nullable_to_non_nullable
                    as int?,
        activeListings:
            freezed == activeListings
                ? _value.activeListings
                : activeListings // ignore: cast_nullable_to_non_nullable
                    as int?,
        isBusinessAccount:
            freezed == isBusinessAccount
                ? _value.isBusinessAccount
                : isBusinessAccount // ignore: cast_nullable_to_non_nullable
                    as bool?,
        businessName:
            freezed == businessName
                ? _value.businessName
                : businessName // ignore: cast_nullable_to_non_nullable
                    as String?,
        businessRegistrationNumber:
            freezed == businessRegistrationNumber
                ? _value.businessRegistrationNumber
                : businessRegistrationNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LandlordImpl implements _Landlord {
  const _$LandlordImpl({
    required this.verificationStatus,
    this.verificationDocumentUrl,
    this.averageRating,
    this.reviewCount,
    this.totalProperties,
    this.activeListings,
    this.isBusinessAccount,
    this.businessName,
    this.businessRegistrationNumber,
    this.description,
  });

  factory _$LandlordImpl.fromJson(Map<String, dynamic> json) =>
      _$$LandlordImplFromJson(json);

  @override
  final String verificationStatus;
  // "pending", "verified", "rejected"
  @override
  final String? verificationDocumentUrl;
  @override
  final double? averageRating;
  @override
  final int? reviewCount;
  @override
  final int? totalProperties;
  @override
  final int? activeListings;
  @override
  final bool? isBusinessAccount;
  @override
  final String? businessName;
  @override
  final String? businessRegistrationNumber;
  @override
  final String? description;

  @override
  String toString() {
    return 'Landlord(verificationStatus: $verificationStatus, verificationDocumentUrl: $verificationDocumentUrl, averageRating: $averageRating, reviewCount: $reviewCount, totalProperties: $totalProperties, activeListings: $activeListings, isBusinessAccount: $isBusinessAccount, businessName: $businessName, businessRegistrationNumber: $businessRegistrationNumber, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LandlordImpl &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(
                  other.verificationDocumentUrl,
                  verificationDocumentUrl,
                ) ||
                other.verificationDocumentUrl == verificationDocumentUrl) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.totalProperties, totalProperties) ||
                other.totalProperties == totalProperties) &&
            (identical(other.activeListings, activeListings) ||
                other.activeListings == activeListings) &&
            (identical(other.isBusinessAccount, isBusinessAccount) ||
                other.isBusinessAccount == isBusinessAccount) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(
                  other.businessRegistrationNumber,
                  businessRegistrationNumber,
                ) ||
                other.businessRegistrationNumber ==
                    businessRegistrationNumber) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    verificationStatus,
    verificationDocumentUrl,
    averageRating,
    reviewCount,
    totalProperties,
    activeListings,
    isBusinessAccount,
    businessName,
    businessRegistrationNumber,
    description,
  );

  /// Create a copy of Landlord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LandlordImplCopyWith<_$LandlordImpl> get copyWith =>
      __$$LandlordImplCopyWithImpl<_$LandlordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LandlordImplToJson(this);
  }
}

abstract class _Landlord implements Landlord {
  const factory _Landlord({
    required final String verificationStatus,
    final String? verificationDocumentUrl,
    final double? averageRating,
    final int? reviewCount,
    final int? totalProperties,
    final int? activeListings,
    final bool? isBusinessAccount,
    final String? businessName,
    final String? businessRegistrationNumber,
    final String? description,
  }) = _$LandlordImpl;

  factory _Landlord.fromJson(Map<String, dynamic> json) =
      _$LandlordImpl.fromJson;

  @override
  String get verificationStatus; // "pending", "verified", "rejected"
  @override
  String? get verificationDocumentUrl;
  @override
  double? get averageRating;
  @override
  int? get reviewCount;
  @override
  int? get totalProperties;
  @override
  int? get activeListings;
  @override
  bool? get isBusinessAccount;
  @override
  String? get businessName;
  @override
  String? get businessRegistrationNumber;
  @override
  String? get description;

  /// Create a copy of Landlord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LandlordImplCopyWith<_$LandlordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
