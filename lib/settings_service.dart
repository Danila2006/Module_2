import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const _themeKey = 'theme';
  static const _languageKey = 'language';
  static const _lastLoginKey = 'lastLogin';

  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  Future<void> saveLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, lang);
  }

  Future<String> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'uk';
  }

  Future<void> saveLastLogin(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastLoginKey, date.toIso8601String());
  }

  Future<DateTime?> loadLastLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final dateStr = prefs.getString(_lastLoginKey);
    if (dateStr == null) return null;
    return DateTime.tryParse(dateStr);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}