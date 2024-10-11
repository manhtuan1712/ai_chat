import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/secure_storage.dart';

class AppProvider extends ChangeNotifier {
  String _user = '';

  String get user => _user;

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

  void setUser(String user) {
    _user = user;
    notifyListeners();
  }

  Future<void> getUser() async {
    _user = await sl<SecureStorage>().getCustomString(
      SecureStorage.user,
    );
    if (_user.isEmpty) {
      _user = _generateRandomBase64(
        16,
      );
      await sl<SecureStorage>().saveCustomString(
        SecureStorage.user,
        _user,
      );
    }
    notifyListeners();
  }

  String _generateRandomBase64(int length) {
    final random = Random.secure();
    final List<int> randomBytes = List<int>.generate(
      length,
      (i) => random.nextInt(
        256,
      ),
    );
    return base64Encode(randomBytes);
  }
}
