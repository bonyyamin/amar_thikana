import 'package:freezed_annotation/freezed_annotation.dart';

part 'landlord.freezed.dart';
part 'landlord.g.dart';

@freezed
class Landlord with _$Landlord {
  const factory Landlord({
    required String verificationStatus, // "pending", "verified", "rejected"
    String? verificationDocumentUrl,
    double? averageRating,
    int? reviewCount,
    int? totalProperties,
    int? activeListings,
    bool? isBusinessAccount,
    String? businessName,
    String? businessRegistrationNumber,
    String? description,
  }) = _Landlord;

  factory Landlord.fromJson(Map<String, dynamic> json) => _$LandlordFromJson(json);
}