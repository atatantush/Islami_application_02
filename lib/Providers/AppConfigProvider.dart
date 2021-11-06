import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'ar';

  void ChangeLanguage(String langCode) {
    if (langCode == appLanguage) {
      return;
    }
    appLanguage = langCode;
    notifyListeners();
  }

  ThemeMode appTheme = ThemeMode.light;

  void ChangeTheme(ThemeMode newMode) {
    if (newMode == appTheme) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
