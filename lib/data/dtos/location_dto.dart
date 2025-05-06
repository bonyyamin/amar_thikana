import '../../domain/models/location/location.dart';
import '../../domain/models/location/address.dart';

class LocationDto {
  final double latitude;
  final double longitude;
  final AddressDto address;
  final String? landmark;
  final String? nearbyUniversity;
  final double? distanceToUniversity;

  LocationDto({
    required this.latitude,
    required this.longitude,
    required this.address,
    this.landmark,
    this.nearbyUniversity,
    this.distanceToUniversity,
  });

  // Convert Firestore data to DTO
  factory LocationDto.fromJson(Map<String, dynamic> json) {
    return LocationDto(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: AddressDto.fromJson(json['address'] as Map<String, dynamic>),
      landmark: json['landmark'] as String?,
      nearbyUniversity: json['nearbyUniversity'] as String?,
      distanceToUniversity:
          json['distanceToUniversity'] != null
              ? (json['distanceToUniversity'] as num).toDouble()
              : null,
    );
  }

  // Convert DTO to Firestore data
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': address.toJson(),
      'landmark': landmark,
      'nearbyUniversity': nearbyUniversity,
      'distanceToUniversity': distanceToUniversity,
    };
  }

  // Convert domain model to DTO
  factory LocationDto.fromDomain(Location location) {
    return LocationDto(
      latitude: location.latitude,
      longitude: location.longitude,
      address: AddressDto.fromDomain(location.address),
      landmark: location.landmark,
      nearbyUniversity: location.nearbyUniversity,
      distanceToUniversity: location.distanceToUniversity,
    );
  }

  // Convert DTO to domain model
  Location toDomain() {
    return Location(
      latitude: latitude,
      longitude: longitude,
      address: address.toDomain(),
      landmark: landmark,
      nearbyUniversity: nearbyUniversity,
      distanceToUniversity: distanceToUniversity,
      city: address.city,
      state:
          address
              .area, // Using area as state since we don't have a separate state field
      country: address.country,
    );
  }
}

class AddressDto {
  final String street;
  final String area;
  final String city;
  final String postalCode;
  final String country;
  final String? additionalInfo;

  AddressDto({
    required this.street,
    required this.area,
    required this.city,
    required this.postalCode,
    required this.country,
    this.additionalInfo,
  });

  // Convert Firestore data to DTO
  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return AddressDto(
      street: json['street'] as String,
      area: json['area'] as String,
      city: json['city'] as String,
      postalCode: json['postalCode'] as String,
      country: json['country'] as String,
      additionalInfo: json['additionalInfo'] as String?,
    );
  }

  // Convert DTO to Firestore data
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'area': area,
      'city': city,
      'postalCode': postalCode,
      'country': country,
      'additionalInfo': additionalInfo,
    };
  }

  // Convert domain model to DTO
  factory AddressDto.fromDomain(Address address) {
    return AddressDto(
      street: address.street,
      area: address.area,
      city: address.city,
      postalCode: address.postalCode,
      country: address.country,
      additionalInfo: address.additionalInfo,
    );
  }

  // Convert DTO to domain model
  Address toDomain() {
    return Address(
      street: street,
      area: area,
      city: city,
      postalCode: postalCode,
      country: country,
      additionalInfo: additionalInfo,
    );
  }
}
