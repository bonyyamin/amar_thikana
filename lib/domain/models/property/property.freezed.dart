// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return _Property.fromJson(json);
}

/// @nodoc
mixin _$Property {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get coverImage => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  double? get pricePerMonth => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get reviewsCount => throw _privateConstructorUsedError;
  int? get bedrooms => throw _privateConstructorUsedError;
  int? get bathrooms => throw _privateConstructorUsedError;
  int? get parkingSpaces => throw _privateConstructorUsedError;
  PropertyType? get type => throw _privateConstructorUsedError;

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyCopyWith<Property> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyCopyWith<$Res> {
  factory $PropertyCopyWith(Property value, $Res Function(Property) then) =
      _$PropertyCopyWithImpl<$Res, Property>;
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    String? coverImage,
    Location? location,
    double? pricePerMonth,
    double? rating,
    int? reviewsCount,
    int? bedrooms,
    int? bathrooms,
    int? parkingSpaces,
    PropertyType? type,
  });

  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$PropertyCopyWithImpl<$Res, $Val extends Property>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? coverImage = freezed,
    Object? location = freezed,
    Object? pricePerMonth = freezed,
    Object? rating = freezed,
    Object? reviewsCount = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
    Object? parkingSpaces = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            coverImage:
                freezed == coverImage
                    ? _value.coverImage
                    : coverImage // ignore: cast_nullable_to_non_nullable
                        as String?,
            location:
                freezed == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as Location?,
            pricePerMonth:
                freezed == pricePerMonth
                    ? _value.pricePerMonth
                    : pricePerMonth // ignore: cast_nullable_to_non_nullable
                        as double?,
            rating:
                freezed == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double?,
            reviewsCount:
                freezed == reviewsCount
                    ? _value.reviewsCount
                    : reviewsCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            bedrooms:
                freezed == bedrooms
                    ? _value.bedrooms
                    : bedrooms // ignore: cast_nullable_to_non_nullable
                        as int?,
            bathrooms:
                freezed == bathrooms
                    ? _value.bathrooms
                    : bathrooms // ignore: cast_nullable_to_non_nullable
                        as int?,
            parkingSpaces:
                freezed == parkingSpaces
                    ? _value.parkingSpaces
                    : parkingSpaces // ignore: cast_nullable_to_non_nullable
                        as int?,
            type:
                freezed == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as PropertyType?,
          )
          as $Val,
    );
  }

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PropertyImplCopyWith<$Res>
    implements $PropertyCopyWith<$Res> {
  factory _$$PropertyImplCopyWith(
    _$PropertyImpl value,
    $Res Function(_$PropertyImpl) then,
  ) = __$$PropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    String? coverImage,
    Location? location,
    double? pricePerMonth,
    double? rating,
    int? reviewsCount,
    int? bedrooms,
    int? bathrooms,
    int? parkingSpaces,
    PropertyType? type,
  });

  @override
  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$$PropertyImplCopyWithImpl<$Res>
    extends _$PropertyCopyWithImpl<$Res, _$PropertyImpl>
    implements _$$PropertyImplCopyWith<$Res> {
  __$$PropertyImplCopyWithImpl(
    _$PropertyImpl _value,
    $Res Function(_$PropertyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? coverImage = freezed,
    Object? location = freezed,
    Object? pricePerMonth = freezed,
    Object? rating = freezed,
    Object? reviewsCount = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
    Object? parkingSpaces = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _$PropertyImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        coverImage:
            freezed == coverImage
                ? _value.coverImage
                : coverImage // ignore: cast_nullable_to_non_nullable
                    as String?,
        location:
            freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as Location?,
        pricePerMonth:
            freezed == pricePerMonth
                ? _value.pricePerMonth
                : pricePerMonth // ignore: cast_nullable_to_non_nullable
                    as double?,
        rating:
            freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double?,
        reviewsCount:
            freezed == reviewsCount
                ? _value.reviewsCount
                : reviewsCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        bedrooms:
            freezed == bedrooms
                ? _value.bedrooms
                : bedrooms // ignore: cast_nullable_to_non_nullable
                    as int?,
        bathrooms:
            freezed == bathrooms
                ? _value.bathrooms
                : bathrooms // ignore: cast_nullable_to_non_nullable
                    as int?,
        parkingSpaces:
            freezed == parkingSpaces
                ? _value.parkingSpaces
                : parkingSpaces // ignore: cast_nullable_to_non_nullable
                    as int?,
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as PropertyType?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyImpl implements _Property {
  const _$PropertyImpl({
    required this.id,
    required this.title,
    this.description,
    this.coverImage,
    this.location,
    this.pricePerMonth,
    this.rating,
    this.reviewsCount,
    this.bedrooms,
    this.bathrooms,
    this.parkingSpaces,
    this.type,
  });

  factory _$PropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? coverImage;
  @override
  final Location? location;
  @override
  final double? pricePerMonth;
  @override
  final double? rating;
  @override
  final int? reviewsCount;
  @override
  final int? bedrooms;
  @override
  final int? bathrooms;
  @override
  final int? parkingSpaces;
  @override
  final PropertyType? type;

  @override
  String toString() {
    return 'Property(id: $id, title: $title, description: $description, coverImage: $coverImage, location: $location, pricePerMonth: $pricePerMonth, rating: $rating, reviewsCount: $reviewsCount, bedrooms: $bedrooms, bathrooms: $bathrooms, parkingSpaces: $parkingSpaces, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.pricePerMonth, pricePerMonth) ||
                other.pricePerMonth == pricePerMonth) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            (identical(other.bedrooms, bedrooms) ||
                other.bedrooms == bedrooms) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms) &&
            (identical(other.parkingSpaces, parkingSpaces) ||
                other.parkingSpaces == parkingSpaces) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    coverImage,
    location,
    pricePerMonth,
    rating,
    reviewsCount,
    bedrooms,
    bathrooms,
    parkingSpaces,
    type,
  );

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      __$$PropertyImplCopyWithImpl<_$PropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyImplToJson(this);
  }
}

abstract class _Property implements Property {
  const factory _Property({
    required final String id,
    required final String title,
    final String? description,
    final String? coverImage,
    final Location? location,
    final double? pricePerMonth,
    final double? rating,
    final int? reviewsCount,
    final int? bedrooms,
    final int? bathrooms,
    final int? parkingSpaces,
    final PropertyType? type,
  }) = _$PropertyImpl;

  factory _Property.fromJson(Map<String, dynamic> json) =
      _$PropertyImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get coverImage;
  @override
  Location? get location;
  @override
  double? get pricePerMonth;
  @override
  double? get rating;
  @override
  int? get reviewsCount;
  @override
  int? get bedrooms;
  @override
  int? get bathrooms;
  @override
  int? get parkingSpaces;
  @override
  PropertyType? get type;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
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
  $Res call({String city, String state, String country});
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
    Object? city = null,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(
      _value.copyWith(
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
  $Res call({String city, String state, String country});
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
    Object? city = null,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(
      _$LocationImpl(
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
    required this.city,
    required this.state,
    required this.country,
  });

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final String city;
  @override
  final String state;
  @override
  final String country;

  @override
  String toString() {
    return 'Location(city: $city, state: $state, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city, state, country);

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
    required final String city,
    required final String state,
    required final String country,
  }) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

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
