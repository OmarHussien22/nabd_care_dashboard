import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      styles: WrapAnimationStyles.slide,
      child: const Center(
        child: CustomText("Settings Page - Coming Soon",
            fontSize: 20, color: AppPalette.textSecondary),
      ),
    );
  }
}
