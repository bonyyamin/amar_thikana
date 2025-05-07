import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/property/property.dart';
import '../../use_cases/property/get_property_details_use_case.dart';

part 'property_details_provider.freezed.dart';

@freezed
class PropertyDetailsState with _$PropertyDetailsState {
  const factory PropertyDetailsState({
    @Default(false) bool isLoading,
    Property? property,
    @Default('') String errorMessage,
  }) = _PropertyDetailsState;

  const PropertyDetailsState._();

  bool get hasError => errorMessage.isNotEmpty;
  bool get hasProperty => property != null;
}

class PropertyDetailsNotifier extends StateNotifier<PropertyDetailsState> {
  final GetPropertyDetailsUseCase _getPropertyDetailsUseCase;

  PropertyDetailsNotifier(this._getPropertyDetailsUseCase)
      : super(const PropertyDetailsState());

  Future<void> getPropertyDetails(String propertyId) async {
    state = state.copyWith(isLoading: true, errorMessage: '');

    try {
      final property = await _getPropertyDetailsUseCase.execute(propertyId);
      state = state.copyWith(
        isLoading: false,
        property: property,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load property details: ${e.toString()}',
      );
    }
  }

  void clearPropertyDetails() {
    state = const PropertyDetailsState();
  }
}

final propertyDetailsProvider =
    StateNotifierProvider.autoDispose<PropertyDetailsNotifier, PropertyDetailsState>(
  (ref) => PropertyDetailsNotifier(
    ref.watch(getPropertyDetailsUseCaseProvider),
  ),
);

final propertyByIdProvider = Provider.family<Property?, String>(
  (ref, propertyId) {
    final state = ref.watch(propertyDetailsProvider);
    if (state.property?.id == propertyId) {
      return state.property;
    }
    return null;
  },
);