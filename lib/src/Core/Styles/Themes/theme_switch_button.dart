// lib/src/Shared/Presentation/Widgets/theme_switch_button.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Styles/Themes/theme_controller.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return Switch.adaptive(
          value: controller.isDark,
          onChanged: (value) => controller.toggleTheme(),
          activeColor: Colors.amber,
          inactiveThumbColor: Colors.blueGrey,
        );
      },
    );
  }
}
