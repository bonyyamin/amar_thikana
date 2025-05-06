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
  double get pricePerMonth => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get reviewsCount => throw _privateConstructorUsedError;
  int? get bedrooms => throw _privateConstructorUsedError;
  int? get bathrooms => throw _privateConstructorUsedError;
  int? get parkingSpaces => throw _privateConstructorUsedError;
  PropertyType get type => throw _privateConstructorUsedError;
  List<String> get amenities => throw _privateConstructorUsedError;
  List<String> get rules => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Map<String, bool>? get utilities => throw _privateConstructorUsedError;

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
    double pricePerMonth,
    double? rating,
    int? reviewsCount,
    int? bedrooms,
    int? bathrooms,
    int? parkingSpaces,
    PropertyType type,
    List<String> amenities,
    List<String> rules,
    List<String> photos,
    String ownerId,
    DateTime createdAt,
    DateTime updatedAt,
    Map<String, bool>? utilities,
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
    Object? pricePerMonth = null,
    Object? rating = freezed,
    Object? reviewsCount = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
    Object? parkingSpaces = freezed,
    Object? type = null,
    Object? amenities = null,
    Object? rules = null,
    Object? photos = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? utilities = freezed,
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
                null == pricePerMonth
                    ? _value.pricePerMonth
                    : pricePerMonth // ignore: cast_nullable_to_non_nullable
                        as double,
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
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as PropertyType,
            amenities:
                null == amenities
                    ? _value.amenities
                    : amenities // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            rules:
                null == rules
                    ? _value.rules
                    : rules // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            photos:
                null == photos
                    ? _value.photos
                    : photos // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            ownerId:
                null == ownerId
                    ? _value.ownerId
                    : ownerId // ignore: cast_nullable_to_non_nullable
                        as String,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            utilities:
                freezed == utilities
                    ? _value.utilities
                    : utilities // ignore: cast_nullable_to_non_nullable
                        as Map<String, bool>?,
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
    double pricePerMonth,
    double? rating,
    int? reviewsCount,
    int? bedrooms,
    int? bathrooms,
    int? parkingSpaces,
    PropertyType type,
    List<String> amenities,
    List<String> rules,
    List<String> photos,
    String ownerId,
    DateTime createdAt,
    DateTime updatedAt,
    Map<String, bool>? utilities,
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
    Object? pricePerMonth = null,
    Object? rating = freezed,
    Object? reviewsCount = freezed,
    Object? bedrooms = freezed,
    Object? bathrooms = freezed,
    Object? parkingSpaces = freezed,
    Object? type = null,
    Object? amenities = null,
    Object? rules = null,
    Object? photos = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? utilities = freezed,
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
            null == pricePerMonth
                ? _value.pricePerMonth
                : pricePerMonth // ignore: cast_nullable_to_non_nullable
                    as double,
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
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as PropertyType,
        amenities:
            null == amenities
                ? _value._amenities
                : amenities // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        rules:
            null == rules
                ? _value._rules
                : rules // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        photos:
            null == photos
                ? _value._photos
                : photos // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        ownerId:
            null == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                    as String,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        utilities:
            freezed == utilities
                ? _value._utilities
                : utilities // ignore: cast_nullable_to_non_nullable
                    as Map<String, bool>?,
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
    required this.location,
    required this.pricePerMonth,
    this.rating,
    this.reviewsCount,
    this.bedrooms,
    this.bathrooms,
    this.parkingSpaces,
    required this.type,
    required final List<String> amenities,
    required final List<String> rules,
    required final List<String> photos,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
    final Map<String, bool>? utilities,
  }) : _amenities = amenities,
       _rules = rules,
       _photos = photos,
       _utilities = utilities;

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
  final double pricePerMonth;
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
  final PropertyType type;
  final List<String> _amenities;
  @override
  List<String> get amenities {
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amenities);
  }

  final List<String> _rules;
  @override
  List<String> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  final String ownerId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final Map<String, bool>? _utilities;
  @override
  Map<String, bool>? get utilities {
    final value = _utilities;
    if (value == null) return null;
    if (_utilities is EqualUnmodifiableMapView) return _utilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Property(id: $id, title: $title, description: $description, coverImage: $coverImage, location: $location, pricePerMonth: $pricePerMonth, rating: $rating, reviewsCount: $reviewsCount, bedrooms: $bedrooms, bathrooms: $bathrooms, parkingSpaces: $parkingSpaces, type: $type, amenities: $amenities, rules: $rules, photos: $photos, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, utilities: $utilities)';
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
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._amenities,
              _amenities,
            ) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(
              other._utilities,
              _utilities,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
    const DeepCollectionEquality().hash(_amenities),
    const DeepCollectionEquality().hash(_rules),
    const DeepCollectionEquality().hash(_photos),
    ownerId,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_utilities),
  ]);

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
    required final Location? location,
    required final double pricePerMonth,
    final double? rating,
    final int? reviewsCount,
    final int? bedrooms,
    final int? bathrooms,
    final int? parkingSpaces,
    required final PropertyType type,
    required final List<String> amenities,
    required final List<String> rules,
    required final List<String> photos,
    required final String ownerId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final Map<String, bool>? utilities,
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
  double get pricePerMonth;
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
  PropertyType get type;
  @override
  List<String> get amenities;
  @override
  List<String> get rules;
  @override
  List<String> get photos;
  @override
  String get ownerId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  Map<String, bool>? get utilities;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
