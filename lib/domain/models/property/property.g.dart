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
      pricePerMonth: (json['pricePerMonth'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      reviewsCount: (json['reviewsCount'] as num?)?.toInt(),
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      parkingSpaces: (json['parkingSpaces'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$PropertyTypeEnumMap, json['type']),
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
      'type': _$PropertyTypeEnumMap[instance.type],
    };

const _$PropertyTypeEnumMap = {
  PropertyType.building: 'building',
  PropertyType.room: 'room',
  PropertyType.house: 'house',
  PropertyType.apartment: 'apartment',
};

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
    };
