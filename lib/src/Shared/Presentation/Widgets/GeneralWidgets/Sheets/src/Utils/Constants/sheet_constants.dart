import 'package:flutter/material.dart';

import '../../../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../Text/custom_text_lib.dart';

class SheetConstants {
  SheetConstants._();
  static SheetConstants get get => SheetConstants._();

  /// Header
  EdgeInsets headerPadding =
      EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 16.toH());
  final double headerTextSize = 6;
  final FW headerTextWeight = FW.semiBold;
  final Color headerTextColor = AppColors.get.title;
}
