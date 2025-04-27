import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';

final propertyFormProvider =
    StateNotifierProvider<PropertyFormNotifier, PropertyFormState>(
      (ref) => PropertyFormNotifier(),
    );

class PropertyFormNotifier extends StateNotifier<PropertyFormState> {
  PropertyFormNotifier() : super(PropertyFormState());

  void updateTitle(String value) => state = state.copyWith(title: value);
  void updateDescription(String value) =>
      state = state.copyWith(description: value);
  void updatePrice(double value) =>
      state = state.copyWith(pricePerMonth: value);
  void updateType(PropertyType type) => state = state.copyWith(type: type);
  void updateAmenities(List<String> amenities) =>
      state = state.copyWith(amenities: amenities);
  void updateRules(List<String> rules) => state = state.copyWith(rules: rules);
  void updateLocation(String location) =>
      state = state.copyWith(location: location);
  void updatePhotos(List<String> photos) =>
      state = state.copyWith(photos: photos);

  void reset() => state = PropertyFormState();
}

class PropertyFormState {
  final String title;
  final String description;
  final double pricePerMonth;
  final PropertyType type;
  final List<String> amenities;
  final List<String> rules;
  final String? location;
  final List<String> photos;

  PropertyFormState({
    this.title = '',
    this.description = '',
    this.pricePerMonth = 0,
    this.type = PropertyType.apartment,
    this.amenities = const [],
    this.rules = const [],
    this.location,
    this.photos = const [],
  });

  PropertyFormState copyWith({
    String? title,
    String? description,
    double? pricePerMonth,
    PropertyType? type,
    List<String>? amenities,
    List<String>? rules,
    String? location,
    List<String>? photos,
  }) {
    return PropertyFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      pricePerMonth: pricePerMonth ?? this.pricePerMonth,
      type: type ?? this.type,
      amenities: amenities ?? this.amenities,
      rules: rules ?? this.rules,
      location: location ?? this.location,
      photos: photos ?? this.photos,
    );
  }
}
