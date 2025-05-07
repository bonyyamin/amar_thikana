import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/property/property.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default([]) List<Property> favorites,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _FavoritesState;

  factory FavoritesState.initial() => const FavoritesState();
  
  factory FavoritesState.loading() => const FavoritesState(isLoading: true);
  
  factory FavoritesState.loaded(List<Property> favorites) => 
      FavoritesState(favorites: favorites);
      
  factory FavoritesState.error(String message) => 
      FavoritesState(errorMessage: message);
}