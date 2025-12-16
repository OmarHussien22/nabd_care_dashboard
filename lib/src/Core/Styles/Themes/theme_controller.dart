

import 'package:flutter/material.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:get/get.dart';
class ThemeController extends GetControllerInterface {

   ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }

    
    Get.changeThemeMode(themeMode);

    update();
  }

  bool get isDark => themeMode == ThemeMode.dark;
}