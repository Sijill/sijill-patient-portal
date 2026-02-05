import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static late SharedPreferences sharedPrefs;

  static Future<SharedPreferences> init() async {
    return sharedPrefs = await SharedPreferences.getInstance();
  }

  // save data
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      return await sharedPrefs.setInt(key, value);
    } else if (value is double) {
      return await sharedPrefs.setDouble(key, value);
    } else if (value is String) {
      return await sharedPrefs.setString(key, value);
    } else if (value is bool) {
      return await sharedPrefs.setBool(key, value);
    } else {
      throw Exception("Unsupported type");
    }
  }

  static bool getOnboarding() {
    return sharedPrefs.getBool("onboarding") ?? false;
  }

  // remove data
  static Future<bool> removeData({required String key}) async {
    return await sharedPrefs.remove(key);
  }
}
