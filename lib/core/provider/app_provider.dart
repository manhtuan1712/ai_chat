import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/secure_storage.dart';

class AppProvider extends ChangeNotifier {
  String _accessToken = '';

  String get accessToken => _accessToken;

  String _user = '';

  String get user => _user;

  AppProvider() {
    _getAccessToken();
    _getUser();
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

  void setUser(
    String value,
  ) {
    _user = value;
    sl<SecureStorage>().saveCustomString(
      SecureStorage.user,
      value,
    );
    notifyListeners();
  }

  void _getUser() async {
    _user = await sl<SecureStorage>().getCustomString(
      SecureStorage.user,
    );
    notifyListeners();
  }
}
