import 'package:shared_preferences/shared_preferences.dart';

/// Обертка над shared_preferences
class SettingsDataSource {
  Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    int? result = prefs.getInt(key);
    return result;
  }

  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool(key);
    return result;
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString(key);
    return result;
  }

  //

  Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  //

  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
