import 'package:freezed_annotation/freezed_annotation.dart';
import 'address.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
    required Address address,
    String? landmark,
    String? nearbyUniversity,
    double? distanceToUniversity, required String city, required String state, required String country, // in kilometers
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
