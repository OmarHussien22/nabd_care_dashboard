import 'package:flutter/material.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/tff_style_imp.dart';

abstract class TFFTextImp extends TffStyleImp {
  final String? title;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;
  final String? fontFamily;
  const TFFTextImp(
      {this.title,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.backgroundColor,
      this.fontFamily});
}
