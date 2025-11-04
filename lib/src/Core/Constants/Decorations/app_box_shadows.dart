import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppBoxShadows {
  AppBoxShadows._();

  /// shadows on buttons as []
  static List<BoxShadow>? buttonShadow({bool isDark = false}) => [
        BoxShadow(
          color: AppColors.get.primary.withOpacity(0.3),
          spreadRadius: 0.1,
          blurRadius: 8,
        ),
      ];

  static Widget circleShadow({
    required Widget child,
    bool isDark = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
              spreadRadius: 0.1,
              blurRadius: 8,
              color: Colors.orange.withOpacity(0.3))
        ],
      ),
      // shape: BoxShape.circle,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: child,
    );
  }
}
