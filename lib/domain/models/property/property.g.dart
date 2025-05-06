// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyImpl _$$PropertyImplFromJson(Map<String, dynamic> json) =>
    _$PropertyImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      coverImage: json['coverImage'] as String?,
      location:
          json['location'] == null
              ? null
              : Location.fromJson(json['location'] as Map<String, dynamic>),
      pricePerMonth: (json['pricePerMonth'] as num).toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      reviewsCount: (json['reviewsCount'] as num?)?.toInt(),
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      parkingSpaces: (json['parkingSpaces'] as num?)?.toInt(),
      type: $enumDecode(_$PropertyTypeEnumMap, json['type']),
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      rules: (json['rules'] as List<dynamic>).map((e) => e as String).toList(),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      ownerId: json['ownerId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      utilities: (json['utilities'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
    );

Map<String, dynamic> _$$PropertyImplToJson(_$PropertyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'location': instance.location?.toJson(),
      'pricePerMonth': instance.pricePerMonth,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'parkingSpaces': instance.parkingSpaces,
      'type': _$PropertyTypeEnumMap[instance.type]!,
      'amenities': instance.amenities,
      'rules': instance.rules,
      'photos': instance.photos,
      'ownerId': instance.ownerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'utilities': instance.utilities,
    };

const _$PropertyTypeEnumMap = {
  PropertyType.building: 'building',
  PropertyType.room: 'room',
  PropertyType.house: 'house',
  PropertyType.apartment: 'apartment',
};
