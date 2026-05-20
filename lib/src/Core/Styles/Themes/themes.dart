import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';

abstract class Themes {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.get.primary,
    scaffoldBackgroundColor: AppColors.get.background,
    
    // Color Scheme
    colorScheme: ColorScheme.light(
      primary: AppColors.get.primary,
      secondary: AppColors.get.secondary,
      surface: AppColors.get.surface,
      error: AppColors.get.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.get.textPrimary,
      surfaceContainerHighest: AppColors.get.surfaceContainer,
    ),

    fontFamily: 'Cairo',

    // Typography
    textTheme: const TextTheme().apply(
      fontFamily: 'Cairo',
      bodyColor: AppColors.get.textPrimary,
      displayColor: AppColors.get.textPrimary,
    ),

    // App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.get.surface,
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.get.textPrimary),
      titleTextStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.get.textPrimary,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    // Card
    cardTheme: CardThemeData(
      color: AppColors.get.surface,
      elevation: 1,
      margin: EdgeInsets.zero,
      shadowColor: Colors.black.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.get.border, width: 1),
      ),
    ),

    // Inputs (Desktop Style)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.get.surface,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.get.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.get.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.get.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.get.error),
      ),
      hoverColor: AppColors.get.surfaceContainer,
      labelStyle: TextStyle(color: AppColors.get.textSecondary),
      hintStyle: TextStyle(color: AppColors.get.textDisabled),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.get.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w600),
      ),
    ),
    
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.get.primary,
        side: BorderSide(color: AppColors.get.border),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w600),
      ),
    ),

    // Divider
    dividerTheme: DividerThemeData(
      color: AppColors.get.divider,
      thickness: 1,
      space: 1,
    ),
  );

  // Dark theme can be added later if requested, focusing on Light Desktop logic primarily.
}
