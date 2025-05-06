// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landlord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LandlordImpl _$$LandlordImplFromJson(Map<String, dynamic> json) =>
    _$LandlordImpl(
      verificationStatus: json['verificationStatus'] as String,
      verificationDocumentUrl: json['verificationDocumentUrl'] as String?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      totalProperties: (json['totalProperties'] as num?)?.toInt(),
      activeListings: (json['activeListings'] as num?)?.toInt(),
      isBusinessAccount: json['isBusinessAccount'] as bool?,
      businessName: json['businessName'] as String?,
      businessRegistrationNumber: json['businessRegistrationNumber'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$LandlordImplToJson(_$LandlordImpl instance) =>
    <String, dynamic>{
      'verificationStatus': instance.verificationStatus,
      'verificationDocumentUrl': instance.verificationDocumentUrl,
      'averageRating': instance.averageRating,
      'reviewCount': instance.reviewCount,
      'totalProperties': instance.totalProperties,
      'activeListings': instance.activeListings,
      'isBusinessAccount': instance.isBusinessAccount,
      'businessName': instance.businessName,
      'businessRegistrationNumber': instance.businessRegistrationNumber,
      'description': instance.description,
    };
