enum UserRole {
  renter,
  landlord;

  String get displayName {
    switch (this) {
      case UserRole.renter:
        return 'Renter';
      case UserRole.landlord:
        return 'Landlord';
    }
  }
}
