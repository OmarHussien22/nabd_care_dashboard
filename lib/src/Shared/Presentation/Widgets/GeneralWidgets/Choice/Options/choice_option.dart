import 'package:flutter/material.dart';
import '../../Text/custom_text_lib.dart';

class ChoiceOption {
  final double titleSize;
  final double subTitleSize;
  final Color titleColor;
  final Color subTitleColor;
  final FW titleFontWeight;
  final FW subTitleFontWeight;

  final double imageRadius;
  final double imageWidth;
  final double imageHeight;

  final Color indicatorColor;
  final double indicatorSize;

  const ChoiceOption({
    required this.titleSize,
    required this.subTitleSize,
    required this.titleColor,
    required this.subTitleColor,
    required this.titleFontWeight,
    required this.subTitleFontWeight,
    required this.imageRadius,
    required this.imageWidth,
    required this.imageHeight,
    required this.indicatorColor,
    required this.indicatorSize,
  });
}
//