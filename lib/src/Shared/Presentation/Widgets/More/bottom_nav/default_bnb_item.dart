import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';

class DefaultBottomNavItem {
  DefaultBottomNavItem._();

  static BottomNavigationBarItem defaultBottomNavItem({
    required String label,
    required String image,
    required String activeImage,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(image),
        color: AppColors.get.bnbUnSelectedItem,
        size: 20.toH(),
        semanticLabel: label.toTr(),
      ),
      activeIcon: ImageIcon(
        AssetImage(activeImage),
        size: 18.toH(),
        color: AppColors.get.bnbSelectedItem,
        semanticLabel: label.toTr(),
      ),
      // ),
      label: label.toTr(),
    );
  }
}
