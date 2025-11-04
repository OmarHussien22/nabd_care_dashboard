part of 'imports_options.dart';

abstract class TFFConstants {
  static ColorInterface get color => AppColors.get;

//<editor-fold desc="input">
  static const double inputFontSize = 5.0;
  static const FontWeight inputFontWeight = FontWeight.w300;
//</editor-fold>
//<editor-fold desc="hint">
  static const double hintFontSize = 6.0;
  static const FontWeight hintFontWeight = FontWeight.w300;

//</editor-fold>
//<editor-fold desc="Header">
  static const double headerFontSize = 6.0;
  static const FontWeight headerFontWeight = FontWeight.w300;

//</editor-fold>
//<editor-fold desc="label">
  static const double labelFontSize = 6.0;
  static const FontWeight labelFontWeight = FontWeight.w300;

//</editor-fold>
//<editor-fold desc="error">
  static const double errorFontSize = 5.0;
  static const FontWeight errorFontWeight = FontWeight.w300;

//</editor-fold>
//<editor-fold desc="upper">
  static const FontWeight upperFontWeight = FontWeight.w300;
  static const double upperFontSize = 6.0;

//</editor-fold>
//<editor-fold desc="prefix">
  static const double prefixFontSize = 6.0;
  static const FontWeight prefixFontWeight = FontWeight.w300;
  static const double prefixIconSize = 6.0;
  static const double prefixIconScale = .3;
  static const double prefixImageScale = 3.5;
  static const double prefixImageSize = 14.0;

//</editor-fold>
//<editor-fold desc="suffix">
  static const double suffixFontSize = 8.0;
  static const FontWeight suffixFontWeight = FontWeight.w300;
  static const double suffixIconSize = 8.0;
  static const double suffixIconScale = .3;
  static const double suffixImageScale = .3;
  static const double suffixImageSize = 10.0;
//</editor-fold>

  static const double prefixConstrainsHeight = 10.0;
  static const double prefixConstrainsWidth = 17.17;
  static const double suffixConstrainsHeight = 6.0;
  static const double suffixConstrainsWidth = 15.17;
  static const double tffBorderRadius = 10;
  static const double tffBorderWidth = .5;
  static const FontWeight tffHeadrTitle = FontWeight.w600;
}
