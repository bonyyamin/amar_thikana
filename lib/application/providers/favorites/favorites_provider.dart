import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritePropertyIdsProvider = StateProvider<List<String>>((ref) {
  return ['1', '3']; // Initially marked favorites by ID
});
