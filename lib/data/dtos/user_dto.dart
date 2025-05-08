import 'dart:convert';
import 'package:amar_thikana/domain/models/user/landlord.dart';
import 'package:amar_thikana/domain/models/user/renter.dart';
import 'package:amar_thikana/domain/models/location/address.dart';
import 'package:amar_thikana/domain/models/user/user.dart';

/// Data Transfer Object for User
/// Handles serialization and deserialization between JSON and domain model
class UserDto {
  final String id;
  final String name;
  final String email;
  final String? profilePicture;
  final String? phoneNumber;
  final Address? address;
  final UserType userType;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime? lastActive;
  final Landlord? landlordDetails;
  final Renter? renterDetails;
  final Map<String, dynamic>? additionalData;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
    this.profilePicture,
    this.phoneNumber,
    this.address,
    required this.userType,
    required this.isVerified,
    required this.createdAt,
    this.lastActive,
    this.landlordDetails,
    this.renterDetails,
    this.additionalData,
  });

  /// Convert DTO to domain model
  User toModel() {
    return User(
      id: id,
      name: name,
      email: email,
      photoUrl: profilePicture,
      phoneNumber: phoneNumber,
      address: address,
      userType: userType,
      isVerified: isVerified,
      createdAt: createdAt,
      lastActive: lastActive,
      landlordDetails: landlordDetails,
      renterDetails: renterDetails,
    );
  }

  /// Create a DTO from domain model
  factory UserDto.fromModel(User user) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
      profilePicture: user.photoUrl,
      phoneNumber: user.phoneNumber,
      address: user.address,
      userType: user.userType,
      isVerified: user.isVerified,
      createdAt: user.createdAt,
      lastActive: user.lastActive,
      landlordDetails: user.landlordDetails,
      renterDetails: user.renterDetails,
    );
  }

  /// Create a DTO from JSON Map
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profilePicture: json['profile_picture'],
      phoneNumber: json['phone_number'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      userType: UserType.values.firstWhere((e) => e.toString().split('.').last == json['user_type']),
      isVerified: json['is_verified'],
      createdAt: DateTime.parse(json['created_at']),
      lastActive: json['last_active'] != null ? DateTime.parse(json['last_active']) : null,
      landlordDetails: json['landlord_details'] != null ? Landlord.fromJson(json['landlord_details']) : null,
      renterDetails: json['renter_details'] != null ? Renter.fromJson(json['renter_details']) : null,
      additionalData: json['additional_data'],
    );
  }

  /// Convert DTO to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_picture': profilePicture,
      'phone_number': phoneNumber,
      'address': address?.toJson(),
      'user_type': userType.toString().split('.').last,
      'is_verified': isVerified,
      'created_at': createdAt.toIso8601String(),
      'last_active': lastActive?.toIso8601String(),
      'landlord_details': landlordDetails?.toJson(),
      'renter_details': renterDetails?.toJson(),
      'additional_data': additionalData,
    };
  }

  /// Convert DTO to JSON string
  String toJsonString() => json.encode(toJson());

  /// Create a DTO from JSON string
  factory UserDto.fromJsonString(String jsonString) {
    return UserDto.fromJson(json.decode(jsonString));
  }

  /// Create a copy of this DTO with modified fields
  UserDto copyWith({
    String? id,
    String? name,
    String? email,
    String? profilePicture,
    String? phoneNumber,
    Address? address,
    UserType? userType,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? lastActive,
    Landlord? landlordDetails,
    Renter? renterDetails,
    Map<String, dynamic>? additionalData,
  }) {
    return UserDto(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      userType: userType ?? this.userType,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      lastActive: lastActive ?? this.lastActive,
      landlordDetails: landlordDetails ?? this.landlordDetails,
      renterDetails: renterDetails ?? this.renterDetails,
      additionalData: additionalData ?? this.additionalData,
    );
  }
}