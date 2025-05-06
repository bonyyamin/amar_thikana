// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  String? get landmark => throw _privateConstructorUsedError;
  String? get nearbyUniversity => throw _privateConstructorUsedError;
  double? get distanceToUniversity => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({
    double latitude,
    double longitude,
    Address address,
    String? landmark,
    String? nearbyUniversity,
    double? distanceToUniversity,
    String city,
    String state,
    String country,
  });

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? landmark = freezed,
    Object? nearbyUniversity = freezed,
    Object? distanceToUniversity = freezed,
    Object? city = null,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(
      _value.copyWith(
            latitude:
                null == latitude
                    ? _value.latitude
                    : latitude // ignore: cast_nullable_to_non_nullable
                        as double,
            longitude:
                null == longitude
                    ? _value.longitude
                    : longitude // ignore: cast_nullable_to_non_nullable
                        as double,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as Address,
            landmark:
                freezed == landmark
                    ? _value.landmark
                    : landmark // ignore: cast_nullable_to_non_nullable
                        as String?,
            nearbyUniversity:
                freezed == nearbyUniversity
                    ? _value.nearbyUniversity
                    : nearbyUniversity // ignore: cast_nullable_to_non_nullable
                        as String?,
            distanceToUniversity:
                freezed == distanceToUniversity
                    ? _value.distanceToUniversity
                    : distanceToUniversity // ignore: cast_nullable_to_non_nullable
                        as double?,
            city:
                null == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String,
            state:
                null == state
                    ? _value.state
                    : state // ignore: cast_nullable_to_non_nullable
                        as String,
            country:
                null == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
    _$LocationImpl value,
    $Res Function(_$LocationImpl) then,
  ) = __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double latitude,
    double longitude,
    Address address,
    String? landmark,
    String? nearbyUniversity,
    double? distanceToUniversity,
    String city,
    String state,
    String country,
  });

  @override
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
    _$LocationImpl _value,
    $Res Function(_$LocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? landmark = freezed,
    Object? nearbyUniversity = freezed,
    Object? distanceToUniversity = freezed,
    Object? city = null,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(
      _$LocationImpl(
        latitude:
            null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                    as double,
        longitude:
            null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                    as double,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as Address,
        landmark:
            freezed == landmark
                ? _value.landmark
                : landmark // ignore: cast_nullable_to_non_nullable
                    as String?,
        nearbyUniversity:
            freezed == nearbyUniversity
                ? _value.nearbyUniversity
                : nearbyUniversity // ignore: cast_nullable_to_non_nullable
                    as String?,
        distanceToUniversity:
            freezed == distanceToUniversity
                ? _value.distanceToUniversity
                : distanceToUniversity // ignore: cast_nullable_to_non_nullable
                    as double?,
        city:
            null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String,
        state:
            null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as String,
        country:
            null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl({
    required this.latitude,
    required this.longitude,
    required this.address,
    this.landmark,
    this.nearbyUniversity,
    this.distanceToUniversity,
    required this.city,
    required this.state,
    required this.country,
  });

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final Address address;
  @override
  final String? landmark;
  @override
  final String? nearbyUniversity;
  @override
  final double? distanceToUniversity;
  @override
  final String city;
  @override
  final String state;
  @override
  final String country;

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude, address: $address, landmark: $landmark, nearbyUniversity: $nearbyUniversity, distanceToUniversity: $distanceToUniversity, city: $city, state: $state, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.nearbyUniversity, nearbyUniversity) ||
                other.nearbyUniversity == nearbyUniversity) &&
            (identical(other.distanceToUniversity, distanceToUniversity) ||
                other.distanceToUniversity == distanceToUniversity) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    latitude,
    longitude,
    address,
    landmark,
    nearbyUniversity,
    distanceToUniversity,
    city,
    state,
    country,
  );

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location({
    required final double latitude,
    required final double longitude,
    required final Address address,
    final String? landmark,
    final String? nearbyUniversity,
    final double? distanceToUniversity,
    required final String city,
    required final String state,
    required final String country,
  }) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  Address get address;
  @override
  String? get landmark;
  @override
  String? get nearbyUniversity;
  @override
  double? get distanceToUniversity;
  @override
  String get city;
  @override
  String get state;
  @override
  String get country;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
