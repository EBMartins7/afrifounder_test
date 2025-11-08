import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  late Box _settingsBox;
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProvider() {
    _settingsBox = Hive.box('settings');
    loadTheme();
  }

  ThemeMode get themeMode => _themeMode;

  void loadTheme() {
    final savedTheme = _settingsBox.get('themeMode', defaultValue: 'system');
    _themeMode = _getThemeModeFromString(savedTheme);
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _settingsBox.put('themeMode', _getStringFromThemeMode(mode));
    notifyListeners();
  }

  ThemeMode _getThemeModeFromString(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _getStringFromThemeMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }
}