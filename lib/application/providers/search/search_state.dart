import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('Lowest rent') String sortBy,
    @Default(RangeValues(250, 2450)) RangeValues priceRange,
    @Default(4) int rating,
    @Default([]) List<String> selectedFacilities,
  }) = _SearchState;
}
