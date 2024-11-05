import 'package:flutter/material.dart';
import 'package:shuei_ai_chat/core/di/injection_container.dart';
import 'package:shuei_ai_chat/core/helpers/secure_storage.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_age_filter_model.dart';
import 'package:shuei_ai_chat/feature/home/data/model/attribute_filter_model.dart';

class AppProvider extends ChangeNotifier {
  String _accessToken = '';

  String get accessToken => _accessToken;

  String _user = '';

  String get user => _user;

  List<AttributeFilterModel> _selectedGender = [];

  List<AttributeFilterModel> get selectedGender => _selectedGender;

  List<AttributeFilterModel> _selectedHobbies = [];

  List<AttributeFilterModel> get selectedHobbies => _selectedHobbies;

  List<AttributeFilterModel> _selectedOccupation = [];

  List<AttributeFilterModel> get selectedOccupation => _selectedOccupation;

  List<AttributeAgeFilterModel> _selectedAge = [];

  List<AttributeAgeFilterModel> get selectedAge => _selectedAge;

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

  void setSelectedGender(
    List<AttributeFilterModel> value,
  ) {
    _selectedGender = value;
    notifyListeners();
  }

  void setSelectedHobbies(
    List<AttributeFilterModel> value,
  ) {
    _selectedHobbies = value;
    notifyListeners();
  }

  void setSelectedOccupation(
    List<AttributeFilterModel> value,
  ) {
    _selectedOccupation = value;
    notifyListeners();
  }

  void setSelectedAge(
    List<AttributeAgeFilterModel> value,
  ) {
    _selectedAge = value;
    notifyListeners();
  }

  Map<String, dynamic> getFilter() {
    final Map<String, dynamic> filter = {};
    if (_selectedGender.isNotEmpty) {
      filter['gender'] = _selectedGender.map((e) => e.id).toList();
    }
    if (_selectedHobbies.isNotEmpty) {
      filter['hobbies'] = _selectedHobbies.map((e) => e.id).toList();
    }
    if (_selectedOccupation.isNotEmpty) {
      filter['occupations'] = _selectedOccupation.map((e) => e.id).toList();
    }
    if (_selectedAge.isNotEmpty) {
      filter['age'] = [];
      for (final age in _selectedAge) {
        for (final id in age.id!) {
          filter['age'].add(id);
        }
      }
    }
    return filter;
  }

  void clearFilter() {
    _selectedGender = [];
    _selectedHobbies = [];
    _selectedOccupation = [];
    _selectedAge = [];
    notifyListeners();
  }
}
