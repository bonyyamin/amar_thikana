import 'package:freezed_annotation/freezed_annotation.dart';
import '../location/location.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
class Property with _$Property {
  const factory Property({
    required String id,
    required String title,
    String? description,
    String? coverImage,
    required Location? location,
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
    Map<String, bool>? utilities,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
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
