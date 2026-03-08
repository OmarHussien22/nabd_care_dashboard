import 'package:flutter/cupertino.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';

class AppInsets {
  AppInsets._();
  // ========================Screen ===================//
  static const double _defaultScreenPadding = 16.0;
  static EdgeInsets defaultScreenALL =
      EdgeInsets.all(_defaultScreenPadding.toRad());
  static EdgeInsets defaultScreenHorizontal =
      EdgeInsets.symmetric(horizontal: _defaultScreenPadding.toW());
  static EdgeInsets defaultScreenVertical =
      EdgeInsets.symmetric(vertical: _defaultScreenPadding.toH());

  static BorderRadius defaultScreenBorderRadius =
      BorderRadius.circular(_defaultScreenPadding.toRad());

  static EdgeInsets defaultScreenOnly(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      EdgeInsets.only(
          left: left.toW(),
          top: top.toH(),
          right: right.toW(),
          bottom: bottom.toH());

  // ========================Sheet ===================//

  static const double _defaultSheetPadding = 8.0;
  static EdgeInsets defaultSheetALL =
      EdgeInsets.all(_defaultSheetPadding.toRad());
  static EdgeInsets defaultSheetHorizontal =
      EdgeInsets.symmetric(horizontal: _defaultSheetPadding.toW());
  static EdgeInsets defaultSheetVertical =
      EdgeInsets.symmetric(vertical: _defaultSheetPadding.toH());

  static BorderRadius defaultSheetBorderRadius =
      BorderRadius.circular(_defaultSheetPadding.toRad());

  static EdgeInsets defaultSheetOnly(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      EdgeInsets.only(
          left: left.toW(),
          top: top.toH(),
          right: right.toW(),
          bottom: bottom.toH());

  // ========================Button ===================//

  static const double _defaultButtonPadding = 10.0;

  static EdgeInsets defaultButtonALL =
      EdgeInsets.all(_defaultButtonPadding.toRad());
  static EdgeInsets defaultButtonHorizontal =
      EdgeInsets.symmetric(horizontal: _defaultButtonPadding.toW());
  static EdgeInsets defaultButtonVertical =
      EdgeInsets.symmetric(vertical: _defaultButtonPadding.toH());

  static const double buttonBorderRadius = 8.0;

  static BorderRadius defaultButtonBorderRadius =
      BorderRadius.circular(buttonBorderRadius.toRad());

  static EdgeInsets defaultButtonOnly(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      EdgeInsets.only(
          left: left.toW(),
          top: top.toH(),
          right: right.toW(),
          bottom: bottom.toH());

  // ========================table ===================//

  static const double _defaultTablePadding = 16.0;
  static const double _defaultTableBorderRadius = 4.0;
  static EdgeInsets defaultTableALL =
      EdgeInsets.all(_defaultTablePadding.toRad());
  static EdgeInsets defaultTableHorizontal =
      EdgeInsets.symmetric(horizontal: _defaultTablePadding.toW());
  static EdgeInsets defaultTableVertical =
      EdgeInsets.symmetric(vertical: _defaultTablePadding.toH());

  static BorderRadius defaultTableBorderRadius =
      BorderRadius.circular(_defaultTableBorderRadius.toRad());

  static EdgeInsets defaultTableOnly(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      EdgeInsets.only(
          left: left.toW(),
          top: top.toH(),
          right: right.toW(),
          bottom: bottom.toH());
}
