import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode mode = ThemeMode.light;
  void changeLanguageCode(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }
  void changeThemeMode(ThemeMode themeMode){
    mode = themeMode;
    notifyListeners();
  }
}
