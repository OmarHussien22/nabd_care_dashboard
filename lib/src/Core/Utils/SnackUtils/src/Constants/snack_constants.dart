import 'package:flutter/material.dart';
enum UtilState {
  success ,
  warning,
  error,
  none,
}

class SnackConstants {
  SnackConstants._();
 /// COLORS
  static const Color successColor = Colors.green;
  static const Color warningColor = Colors.orange;
  static const Color errorColor = Colors.red;
  static const Color noneColor = Colors.blue;

  /// Icons
  static const IconData successIcon = Icons.check_circle;
  static const IconData warningIcon = Icons.warning;
  static const IconData errorIcon = Icons.error;
  static const IconData noneIcon = Icons.info;

  /// Icons Colors
  static const Color successIconColor = Colors.white;
  static const Color warningIconColor = Colors.white;
  static const Color errorIconColor = Colors.white;
  static const Color noneIconColor = Colors.white;

  /// Title Colors
  static const Color successTitleColor = Colors.white;
  static const Color warningTitleColor = Colors.white;
  static const Color errorTitleColor = Colors.white;
  static const Color noneTitleColor = Colors.white;

  /// Message Colors
  static const Color successMessageColor = Colors.white;
  static const Color warningMessageColor = Colors.white;
  static const Color errorMessageColor = Colors.white;
  static const Color noneMessageColor = Colors.white;

  /// Title Sizes
  static const double successTitleSize = 16;
  static const double warningTitleSize = 16;
  static const double errorTitleSize = 16;
  static const double noneTitleSize = 16;

  /// Message Sizes

  static const double successMessageSize = 14;
  static const double warningMessageSize = 14;
  static const double errorMessageSize = 14;
  static const double noneMessageSize = 14;

  /// Title Font Weights
  static const FontWeight successTitleFontWeight = FontWeight.bold;
  static const FontWeight warningTitleFontWeight = FontWeight.bold;
  static const FontWeight errorTitleFontWeight = FontWeight.bold;
  static const FontWeight noneTitleFontWeight = FontWeight.bold;

  /// Message Font Weights
  static const FontWeight successMessageFontWeight = FontWeight.normal;
  static const FontWeight warningMessageFontWeight = FontWeight.normal;
  static const FontWeight errorMessageFontWeight = FontWeight.normal;
  static const FontWeight noneMessageFontWeight = FontWeight.normal;

  /// Other
  static const Duration snackBarDuration = Duration(seconds: 3);
  /// Action
  static const String mainActionText = 'OK';
  static const Color  actionDisabledTextColor = Colors.grey;
  static const Color  actionTextColor = Colors.white;

}