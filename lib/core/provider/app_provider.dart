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

  List<AttributeFilterModel> _selectedGenderFavorite = [];

  List<AttributeFilterModel> selectedGender(bool isFavorite) =>
      isFavorite ? _selectedGenderFavorite : _selectedGender;

  List<AttributeFilterModel> _selectedHobbies = [];

  List<AttributeFilterModel> _selectedHobbiesFavorite = [];

  List<AttributeFilterModel> selectedHobbies(bool isFavorite) =>
      isFavorite ? _selectedHobbiesFavorite : _selectedHobbies;

  List<AttributeFilterModel> _selectedOccupation = [];

  List<AttributeFilterModel> _selectedOccupationFavorite = [];

  List<AttributeFilterModel> selectedOccupation(bool isFavorite) =>
      isFavorite ? _selectedOccupationFavorite : _selectedOccupation;

  List<AttributeAgeFilterModel> _selectedAge = [];

  List<AttributeAgeFilterModel> _selectedAgeFavorite = [];

  List<AttributeAgeFilterModel> selectedAge(bool isFavorite) =>
      isFavorite ? _selectedAgeFavorite : _selectedAge;

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

  Map<String, dynamic> getFilter(bool isFavorite) {
    final Map<String, dynamic> filter = {};
    if (selectedGender(isFavorite).isNotEmpty) {
      filter['gender'] = selectedGender(isFavorite).map((e) => e.id).toList();
    }
    if (selectedHobbies(isFavorite).isNotEmpty) {
      filter['hobbies'] = selectedHobbies(isFavorite).map((e) => e.id).toList();
    }
    if (selectedOccupation(isFavorite).isNotEmpty) {
      filter['occupations'] =
          selectedOccupation(isFavorite).map((e) => e.id).toList();
    }
    if (selectedAge(isFavorite).isNotEmpty) {
      filter['age'] = [];
      for (final age in selectedAge(isFavorite)) {
        for (final id in age.id!) {
          filter['age'].add(id);
        }
      }
    }
    return filter;
  }

  void clearFilter() {
    _selectedGender = [];
    _selectedGenderFavorite = [];
    _selectedHobbies = [];
    _selectedHobbiesFavorite = [];
    _selectedOccupation = [];
    _selectedOccupationFavorite = [];
    _selectedAge = [];
    _selectedAgeFavorite = [];
    notifyListeners();
  }
}
