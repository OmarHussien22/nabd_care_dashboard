import 'package:flutter/material.dart';

class ColorPaletteModel {
  late final MaterialColor colors;
  // late final String ? logo;
  ColorPaletteModel._({
    required this.colors,
    // this.logo,
  });
}

class ColorPalette {
  static List<ColorPaletteModel> palette = [
    /// main app color
    ColorPaletteModel._(
      colors: const MaterialColor(
        0xFF3f44dc,
        <int, Color>{
          50: Color(0xff494EE6), //10%
          100: Color(0xff3A3FD7), //20%
          200: Color(0xff353AD2), //30%
          300: Color(0xff2B30C8), //40%
          400: Color(0xFF171CB4), //50%
          500: Color(0xff2126BE), //60%
          600: Color(0xff171CB4), //70%
          700: Color(0xff0D12AA), //80%
          800: Color(0xff0308A0), //90%
          900: Color(0xff000000), //100%
        },
      ),
    ),
  ];
}

