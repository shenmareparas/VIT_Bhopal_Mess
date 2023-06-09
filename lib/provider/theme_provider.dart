import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/utils/color_schemes.dart';

enum ThemeType { light, dark }

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = lightTheme;
  ThemeType _currentThemeType = ThemeType.light;

  ThemeData get currentTheme => _currentTheme;
  ThemeType get currentThemeType => _currentThemeType;

  static const String _themeModeKey = 'theme_mode';

  Future<void> saveThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, _currentThemeType.toString());
  }

  Future<void> loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeModeString = prefs.getString(_themeModeKey);

    if (themeModeString != null) {
      _currentThemeType = ThemeType.values.firstWhere(
        (type) => type.toString() == themeModeString,
        orElse: () => ThemeType.light,
      );
      _currentTheme =
          _currentThemeType == ThemeType.light ? lightTheme : darkTheme;
    }
  }

  Future<void> toggleTheme() async {
    if (_currentThemeType == ThemeType.light) {
      _currentThemeType = ThemeType.dark;
      _currentTheme = darkTheme;
    } else {
      _currentThemeType = ThemeType.light;
      _currentTheme = lightTheme;
    }
    await saveThemeMode();
    notifyListeners();
  }

  Future<void> initializeTheme() async {
    await loadThemeMode();
    notifyListeners();
  }
}

final lightTheme = ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
final darkTheme = ThemeData(useMaterial3: true, colorScheme: darkColorScheme);
