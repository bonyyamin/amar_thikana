// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RenterImpl _$$RenterImplFromJson(Map<String, dynamic> json) => _$RenterImpl(
  occupation: json['occupation'] as String?,
  isStudent: json['isStudent'] as bool?,
  universityName: json['universityName'] as String?,
  employerName: json['employerName'] as String?,
  bio: json['bio'] as String?,
  preferredAreas:
      (json['preferredAreas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  budgetMin: (json['budgetMin'] as num?)?.toDouble(),
  budgetMax: (json['budgetMax'] as num?)?.toDouble(),
  preferredPropertyType: json['preferredPropertyType'] as String?,
  moveInDate:
      json['moveInDate'] == null
          ? null
          : DateTime.parse(json['moveInDate'] as String),
);

Map<String, dynamic> _$$RenterImplToJson(_$RenterImpl instance) =>
    <String, dynamic>{
      'occupation': instance.occupation,
      'isStudent': instance.isStudent,
      'universityName': instance.universityName,
      'employerName': instance.employerName,
      'bio': instance.bio,
      'preferredAreas': instance.preferredAreas,
      'budgetMin': instance.budgetMin,
      'budgetMax': instance.budgetMax,
      'preferredPropertyType': instance.preferredPropertyType,
      'moveInDate': instance.moveInDate?.toIso8601String(),
    };
