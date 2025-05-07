import 'package:amar_thikana/domain/models/user/landlord.dart';
import 'package:amar_thikana/domain/models/user/renter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../location/address.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserType { renter, landlord, admin }

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    required UserType userType,
    String? photoUrl,
    String? phoneNumber,
    Address? address,
    required bool isVerified,
    required DateTime createdAt,
    DateTime? lastActive,
    // Fields specific to user types
    // These would be null if not applicable to the user type
    @Default(null) Landlord? landlordDetails,
    @Default(null) Renter? renterDetails,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String firstName,
    required String lastName,
    String? profilePicture,
    required String email,
    required DateTime createdAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
