import 'package:freezed_annotation/freezed_annotation.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
class Property with _$Property {
  const factory Property({
    required String id,
    required String title,
    String? description,
    String? coverImage,
    Location? location,
    required double pricePerMonth,
    double? rating,
    int? reviewsCount,
    int? bedrooms,
    int? bathrooms,
    int? parkingSpaces,
    required PropertyType type,
    required List<String> amenities,
    required List<String> rules,
    required List<String> photos,
    required String ownerId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String city,
    required String state,
    required String country,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

enum PropertyType {
  @JsonValue('building')
  building,
  @JsonValue('room')
  room,
  @JsonValue('house')
  house,
  @JsonValue('apartment')
  apartment,
}
