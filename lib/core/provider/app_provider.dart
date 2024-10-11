import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/secure_storage.dart';

class AppProvider extends ChangeNotifier {
  String _accessToken = '';

  String get accessToken => _accessToken;

  AppProvider() {
    _getAccessToken();
  }

  void setAccessToken(
    String value,
  ) {
    _accessToken = value;
    sl<SecureStorage>().saveCustomString(
      SecureStorage.apiToken,
      value,
    );
    notifyListeners();
  }

  void _getAccessToken() async {
    _accessToken = await sl<SecureStorage>().getCustomString(
      SecureStorage.apiToken,
    );
    notifyListeners();
  }
}
