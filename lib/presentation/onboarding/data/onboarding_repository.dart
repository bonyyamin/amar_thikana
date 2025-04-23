

import 'package:shared_preferences/shared_preferences.dart';

class OnboardingRepository {
  static const String _onboardingCompleteKey = 'onboardingComplete';

  Future<SharedPreferences> _getPrefs() async {
    return SharedPreferences.getInstance();
  }

  Future<bool> isOnboardingComplete() async {
    final prefs = await _getPrefs();
    return prefs.getBool(_onboardingCompleteKey) ?? false; // Default to false
  }

  Future<void> setOnboardingComplete() async {
    final prefs = await _getPrefs();
    await prefs.setBool(_onboardingCompleteKey, true);
  }
}