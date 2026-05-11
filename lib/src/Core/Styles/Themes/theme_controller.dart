
import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Services/Storage/storage_service.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:get/get.dart';
class ThemeController extends GetControllerInterface {

  final _storage = StorageService<String>();
  static const String _themeKey = 'theme_mode';

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  void _loadTheme() {
    final savedTheme = _storage.read(_themeKey);
    if (savedTheme == 'dark') {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    Get.changeThemeMode(themeMode);
  }

   ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }

    _storage.save(_themeKey, value: themeMode == ThemeMode.dark ? 'dark' : 'light');
    Get.changeThemeMode(themeMode);

    update();
  }

  bool get isDark => themeMode == ThemeMode.dark;
}