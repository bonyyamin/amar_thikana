// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_rules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyRulesImpl _$$PropertyRulesImplFromJson(Map<String, dynamic> json) =>
    _$PropertyRulesImpl(
      genderPreference: json['genderPreference'] as String,
      smokingAllowed: json['smokingAllowed'] as bool,
      petsAllowed: json['petsAllowed'] as bool,
      guestPolicy: json['guestPolicy'] as String,
      additionalRules: json['additionalRules'] as String?,
    );

Map<String, dynamic> _$$PropertyRulesImplToJson(_$PropertyRulesImpl instance) =>
    <String, dynamic>{
      'genderPreference': instance.genderPreference,
      'smokingAllowed': instance.smokingAllowed,
      'petsAllowed': instance.petsAllowed,
      'guestPolicy': instance.guestPolicy,
      'additionalRules': instance.additionalRules,
    };
