// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      landmark: json['landmark'] as String?,
      nearbyUniversity: json['nearbyUniversity'] as String?,
      distanceToUniversity: (json['distanceToUniversity'] as num?)?.toDouble(),
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address.toJson(),
      'landmark': instance.landmark,
      'nearbyUniversity': instance.nearbyUniversity,
      'distanceToUniversity': instance.distanceToUniversity,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
    };
