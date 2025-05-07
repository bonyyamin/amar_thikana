enum Amenity {
  wifi('WiFi', 'wifi_icon.png'),
  ac('AC', 'ac_icon.png'),
  attachedBath('Attached Bath', 'bath_icon.png'),
  kitchenAccess('Kitchen Access', 'kitchen_icon.png'),
  furnished('Furnished', 'furniture_icon.png'),
  parking('Parking', 'parking_icon.png'),
  lift('Lift', 'lift_icon.png'),
  generator('Generator', 'generator_icon.png'),
  securityGuard('Security Guard', 'security_icon.png'),
  mealSystem('Meal System', 'meal_icon.png'),
  studyTable('Study Table', 'table_icon.png'),
  tv('TV', 'tv_icon.png'),
  refrigerator('Refrigerator', 'fridge_icon.png'),
  washingMachine('Washing Machine', 'washing_icon.png'),
  balcony('Balcony', 'balcony_icon.png'),
  rooftopAccess('Rooftop Access', 'roof_icon.png');

  final String displayName;
  final String iconAsset;

  const Amenity(this.displayName, this.iconAsset);

  String get iconPath => 'assets/icons/amenities/$iconAsset';
}
