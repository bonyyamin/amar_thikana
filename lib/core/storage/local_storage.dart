import 'package:shared_preferences/shared_preferences.dart';

/// Local storage utility for storing and retrieving data
class LocalStorage {
  /// Saves data to local storage
  Future<bool> saveData(String key, String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(key, value);
    } catch (e) {
      print('Error saving data: $e');
      return false;
    }
  }

  /// Retrieves data from local storage
  Future<String?> getData(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } catch (e) {
      print('Error retrieving data: $e');
      return null;
    }
  }

  /// Removes specific data from local storage
  Future<bool> removeData(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(key);
    } catch (e) {
      print('Error removing data: $e');
      return false;
    }
  }

  /// Clears all stored data
  Future<bool> clearData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.clear();
    } catch (e) {
      print('Error clearing data: $e');
      return false;
    }
  }
}