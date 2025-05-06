import 'package:amar_thikana/domain/models/location/location.dart'
    as property_model
    show Location;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/property/property.dart' as property_model;
import '../../domain/models/property/property_rules.dart';
import 'location_dto.dart';

class PropertyDto {
  final String? id;
  final String title;
  final String description;
  final double rent;
  final double securityDeposit;
  final String propertyType;
  final LocationDto location;
  final String landlordId;
  final List<String> imageUrls;
  final String? videoUrl;
  final double size;
  final String sizeUnit;
  final int? floorLevel;
  final int? bedrooms;
  final int? bathrooms;
  final List<String> amenities;
  final PropertyRulesDto rules;
  final String status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final double? averageRating;
  final int? reviewCount;
  final Map<String, bool>? utilities;

  PropertyDto({
    this.id,
    required this.title,
    required this.description,
    required this.rent,
    required this.securityDeposit,
    required this.propertyType,
    required this.location,
    required this.landlordId,
    required this.imageUrls,
    this.videoUrl,
    required this.size,
    required this.sizeUnit,
    this.floorLevel,
    this.bedrooms,
    this.bathrooms,
    required this.amenities,
    required this.rules,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.averageRating,
    this.reviewCount,
    this.utilities,
  });

  // Convert Firestore data to DTO
  factory PropertyDto.fromJson(Map<String, dynamic> json) {
    return PropertyDto(
      id: json['id'],
      title: json['title'] as String,
      description: json['description'] as String,
      rent:
          (json['pricePerMonth'] as num)
              .toDouble(), // Changed from rent to pricePerMonth
      securityDeposit: (json['securityDeposit'] as num).toDouble(),
      propertyType: json['type'] as String, // Changed from propertyType to type
      location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      landlordId:
          json['ownerId'] as String, // Changed from landlordId to ownerId
      imageUrls: List<String>.from(
        json['photos'] as List,
      ), // Changed from imageUrls to photos
      videoUrl: json['videoUrl'] as String?,
      size: (json['size'] as num).toDouble(),
      sizeUnit: json['sizeUnit'] as String,
      floorLevel: json['floorLevel'] as int?,
      bedrooms: json['bedrooms'] as int?,
      bathrooms: json['bathrooms'] as int?,
      amenities: List<String>.from(json['amenities'] as List),
      rules: PropertyRulesDto.fromJson(json['rules'] as Map<String, dynamic>),
      status: json['status'] as String,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt:
          json['updatedAt'] != null
              ? (json['updatedAt'] as Timestamp).toDate()
              : null,
      averageRating:
          json['averageRating'] != null
              ? (json['averageRating'] as num).toDouble()
              : null,
      reviewCount: json['reviewCount'] as int?,
      utilities:
          json['utilities'] != null
              ? Map<String, bool>.from(json['utilities'] as Map)
              : null,
    );
  }

  // Convert DTO to Firestore data
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'pricePerMonth': rent, // Changed from rent to pricePerMonth
      'securityDeposit': securityDeposit,
      'type': propertyType, // Changed from propertyType to type
      'location': location.toJson(),
      'ownerId': landlordId, // Changed from landlordId to ownerId
      'photos': imageUrls, // Changed from imageUrls to photos
      'videoUrl': videoUrl,
      'size': size,
      'sizeUnit': sizeUnit,
      'floorLevel': floorLevel,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'amenities': amenities,
      'rules': rules.toJson(),
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'averageRating': averageRating,
      'reviewCount': reviewCount,
      'utilities': utilities,
    };
  }

  // Convert domain model to DTO
  factory PropertyDto.fromDomain(property_model.Property property) {
    return PropertyDto(
      id: property.id,
      title: property.title,
      description: property.description ?? '',
      rent: property.pricePerMonth,
      securityDeposit: 0.0, // Default value since it's not in Property model
      propertyType: property.type.toString().split('.').last,
      location:
          property.location != null
              ? LocationDto.fromDomain(property.location!)
              : LocationDto(
                latitude: 0,
                longitude: 0,
                address: AddressDto(
                  street: '',
                  area: '',
                  city: property.location?.city ?? '',
                  postalCode: '',
                  country: property.location?.country ?? '',
                  additionalInfo: null,
                ),
                landmark: null,
                nearbyUniversity: null,
                distanceToUniversity: null,
              ),
      landlordId: property.ownerId,
      imageUrls: property.photos,
      videoUrl: null, // Not in Property model
      size: 0.0, // Default value since it's not in Property model
      sizeUnit: 'sqft', // Default value since it's not in Property model
      floorLevel: null, // Not in Property model
      bedrooms: property.bedrooms,
      bathrooms: property.bathrooms,
      amenities: property.amenities,
      rules: PropertyRulesDto(
        genderPreference: 'any',
        smokingAllowed: false,
        petsAllowed: false,
        guestPolicy: 'allowed',
        additionalRules: property.rules.join(', '),
      ),
      status: 'available',
      createdAt: property.createdAt,
      updatedAt: property.updatedAt,
      averageRating: property.rating,
      reviewCount: property.reviewsCount ?? 0,
      utilities: property.utilities ?? {},
    );
  }

  // Convert DTO to domain model
  property_model.Property toDomain() {
    final propertyLocation = location.toDomain();
    return property_model.Property(
      id: id ?? '',
      title: title,
      description: description,
      coverImage: imageUrls.isNotEmpty ? imageUrls.first : null,
      location: property_model.Location(
        latitude: propertyLocation.latitude,
        longitude: propertyLocation.longitude,
        address: propertyLocation.address,
        city: propertyLocation.address.city,
        state: propertyLocation.address.area,
        country: propertyLocation.address.country,
        landmark: propertyLocation.landmark,
        nearbyUniversity: propertyLocation.nearbyUniversity,
        distanceToUniversity: propertyLocation.distanceToUniversity,
      ),
      pricePerMonth: rent,
      rating: averageRating,
      reviewsCount: reviewCount,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      parkingSpaces: null,
      type: property_model.PropertyType.values.firstWhere(
        (e) =>
            e.toString().split('.').last.toLowerCase() ==
            propertyType.toLowerCase(),
        orElse: () => property_model.PropertyType.room,
      ),
      amenities: amenities,
      rules:
          rules.additionalRules != null && rules.additionalRules!.isNotEmpty
              ? rules.additionalRules!.split(',').map((e) => e.trim()).toList()
              : <String>[],
      photos: imageUrls,
      ownerId: landlordId,
      createdAt: createdAt,
      updatedAt: updatedAt ?? createdAt,
      utilities: utilities,
    );
  }

  // Helper method to parse property type string to enum
}

class PropertyRulesDto {
  final String genderPreference;
  final bool smokingAllowed;
  final bool petsAllowed;
  final String guestPolicy;
  final String? additionalRules;

  PropertyRulesDto({
    required this.genderPreference,
    required this.smokingAllowed,
    required this.petsAllowed,
    required this.guestPolicy,
    this.additionalRules,
  });

  // Convert Firestore data to DTO
  factory PropertyRulesDto.fromJson(Map<String, dynamic> json) {
    return PropertyRulesDto(
      genderPreference: json['genderPreference'] as String,
      smokingAllowed: json['smokingAllowed'] as bool,
      petsAllowed: json['petsAllowed'] as bool,
      guestPolicy: json['guestPolicy'] as String,
      additionalRules: json['additionalRules'] as String?,
    );
  }

  // Convert DTO to Firestore data
  Map<String, dynamic> toJson() {
    return {
      'genderPreference': genderPreference,
      'smokingAllowed': smokingAllowed,
      'petsAllowed': petsAllowed,
      'guestPolicy': guestPolicy,
      'additionalRules': additionalRules,
    };
  }

  // Convert domain model to DTO
  factory PropertyRulesDto.fromDomain(PropertyRules rules) {
    return PropertyRulesDto(
      genderPreference: rules.genderPreference,
      smokingAllowed: rules.smokingAllowed,
      petsAllowed: rules.petsAllowed,
      guestPolicy: rules.guestPolicy,
      additionalRules: rules.additionalRules,
    );
  }

  // Convert DTO to domain model
  PropertyRules toDomain() {
    return PropertyRules(
      genderPreference: genderPreference,
      smokingAllowed: smokingAllowed,
      petsAllowed: petsAllowed,
      guestPolicy: guestPolicy,
      additionalRules: additionalRules,
    );
  }
}
