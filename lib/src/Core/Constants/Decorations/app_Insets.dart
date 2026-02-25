import 'package:flutter/cupertino.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';

class AppInsets {
  AppInsets._();
  static const double _defaultScreenPadding = 16.0;
  static EdgeInsets defaultScreenALL =
      EdgeInsets.all(_defaultScreenPadding.toRad());
  static EdgeInsets defaultScreenHorizontal =
      EdgeInsets.symmetric(horizontal: _defaultScreenPadding.toW());
  static EdgeInsets defaultScreenVertical =
      EdgeInsets.symmetric(vertical: _defaultScreenPadding.toH());

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
}
