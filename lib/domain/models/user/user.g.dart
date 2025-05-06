// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
  photoUrl: json['photoUrl'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  address:
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
  isVerified: json['isVerified'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastActive:
      json['lastActive'] == null
          ? null
          : DateTime.parse(json['lastActive'] as String),
  landlordDetails:
      json['landlordDetails'] == null
          ? null
          : Landlord.fromJson(json['landlordDetails'] as Map<String, dynamic>),
  renterDetails:
      json['renterDetails'] == null
          ? null
          : Renter.fromJson(json['renterDetails'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'photoUrl': instance.photoUrl,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address?.toJson(),
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastActive': instance.lastActive?.toIso8601String(),
      'landlordDetails': instance.landlordDetails?.toJson(),
      'renterDetails': instance.renterDetails?.toJson(),
    };

const _$UserTypeEnumMap = {
  UserType.renter: 'renter',
  UserType.landlord: 'landlord',
  UserType.admin: 'admin',
};
