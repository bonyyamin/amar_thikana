import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/models/property/property.dart';
import '../../dtos/property_dto.dart';

class PropertyLocalDataSource {
  final SharedPreferences _prefs;
  
  // Key prefix for property cache
  static const String _keyPrefix = 'property_';
  
  PropertyLocalDataSource(this._prefs);
  
  // Cache a property
  Future<void> cacheProperty(Property property) async {
    try {
      final propertyDto = PropertyDto.fromDomain(property);
      await _prefs.setString(
        _keyPrefix + property.id,
        jsonEncode(propertyDto.toJson()),
      );
    } catch (e) {
      throw Exception('Failed to cache property: $e');
    }
  }
  
  // Get a cached property
  Future<Property?> getProperty(String propertyId) async {
    try {
      final jsonString = _prefs.getString(_keyPrefix + propertyId);
      if (jsonString == null) {
        return null;
      }
      
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final propertyDto = PropertyDto.fromJson(json);
      return propertyDto.toDomain();
    } catch (e) {
      // If there's an error, just return null instead of crashing
      return null;
    }
  }
  
  // Remove a property from cache
  Future<void> removeProperty(String propertyId) async {
    await _prefs.remove(_keyPrefix + propertyId);
  }
  
  // Clear all cached properties
  Future<void> clearCache() async {
    final keys = _prefs.getKeys();
    for (final key in keys) {
      if (key.startsWith(_keyPrefix)) {
        await _prefs.remove(key);
      }
    }
  }
}