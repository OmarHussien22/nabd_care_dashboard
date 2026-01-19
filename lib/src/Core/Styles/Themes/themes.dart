import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';

abstract class Themes {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppPalette.primary,
    scaffoldBackgroundColor: AppPalette.background,
    
    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: AppPalette.primary,
      secondary: AppPalette.secondary,
      surface: AppPalette.surface,
      error: AppPalette.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppPalette.textPrimary,
      surfaceContainerHighest: AppPalette.surfaceContainer,
    ),

    // Typography
    textTheme: GoogleFonts.interTextTheme().apply(
      bodyColor: AppPalette.textPrimary,
      displayColor: AppPalette.textPrimary,
    ),

    // App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: AppPalette.surface,
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: false,
      iconTheme: const IconThemeData(color: AppPalette.textPrimary),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppPalette.textPrimary,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    // Card
    cardTheme: CardThemeData(
      color: AppPalette.surface,
      elevation: 1,
      margin: EdgeInsets.zero,
      shadowColor: Colors.black.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppPalette.border, width: 1),
      ),
    ),

    // Inputs (Desktop Style)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPalette.surface,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppPalette.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppPalette.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppPalette.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppPalette.error),
      ),
      hoverColor: AppPalette.surfaceContainer,
      labelStyle: const TextStyle(color: AppPalette.textSecondary),
      hintStyle: const TextStyle(color: AppPalette.textDisabled),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalette.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
    ),
    
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppPalette.primary,
        side: const BorderSide(color: AppPalette.border),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppPalette.divider,
      thickness: 1,
      space: 1,
    ),
  );

  // Dark theme can be added later if requested, focusing on Light Desktop logic primarily.
}
