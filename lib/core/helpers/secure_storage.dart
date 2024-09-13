import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static const String apiToken = 'apiToken';
  static const String isFirstTime = 'isFirstTime';
  static const String user = 'user';

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> getCustomString(String key) async =>
      await _secureStorage.read(key: key) ?? '';

  Future<void> init() async {
    final SharedPreferences prefs = await _prefs;
    bool firstTime = prefs.getBool(isFirstTime) ?? true;
    if (firstTime) {
      _secureStorage.deleteAll();
      prefs.setBool(isFirstTime, false);
    }
  }

  saveCustomString(String key, String data) async {
    await _secureStorage.write(key: key, value: data);
  }

  removeCustomString(String key) async {
    await _secureStorage.delete(key: key);
  }
}
