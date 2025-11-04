import 'package:flutter/material.dart';

class SnackObject {
  final Color? color;
  final IconData? icon;
  final Color? iconColor;
  final Color? titleColor;
  final Color? messageColor;
  final double? titleSize;
  final double? messageSize;
  final FontWeight? titleFontWeight ;
  final FontWeight ?messageFontWeight ;
  final Duration ?appearDuration;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
   final SnackBarBehavior? behavior;
  final double? elevation;

  const SnackObject({
     this.color,
     this.icon,
     this.iconColor,
     this.titleColor,
     this.titleSize,
     this.titleFontWeight,
     this.messageSize,
     this.messageFontWeight,
     this.messageColor,
      this.padding,
     this.shape ,
      this.behavior,
     this.elevation,
    this.appearDuration = const Duration(seconds: 3),
  });
}
