import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/search/search_state.dart';

final searchFiltersProvider =
    StateNotifierProvider<SearchFiltersNotifier, SearchState>((ref) {
      return SearchFiltersNotifier();
    });

class SearchFiltersNotifier extends StateNotifier<SearchState> {
  SearchFiltersNotifier() : super(const SearchState());

  void setSortBy(String sortBy) {
    state = state.copyWith(sortBy: sortBy);
  }

  void setPriceRange(RangeValues range) {
    state = state.copyWith(priceRange: range);
  }

  void setRating(int rating) {
    state = state.copyWith(rating: rating);
  }

  void toggleFacility(String facility) {
    final currentFacilities = [...state.selectedFacilities];
    if (currentFacilities.contains(facility)) {
      currentFacilities.remove(facility);
    } else {
      currentFacilities.add(facility);
    }
    state = state.copyWith(selectedFacilities: currentFacilities);
  }

  void clearAll() {
    state = const SearchState();
  }
}
