import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'ar';
  ThemeMode mode = ThemeMode.light;

  void changeLanguageCode(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode themeMode) {
    mode = themeMode;
    notifyListeners();
  }

  String getBackgroundImage() {
    if (mode == ThemeMode.light) {
      return 'assets/images/bg.png';
    } else {
      return 'assets/images/dark_bg.png';
    }
  }
}
