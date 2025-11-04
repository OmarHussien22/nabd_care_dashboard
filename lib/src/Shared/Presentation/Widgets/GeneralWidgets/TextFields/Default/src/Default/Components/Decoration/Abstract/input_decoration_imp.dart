import 'package:flutter/material.dart';

abstract class InputDecorationImp {
  final Color? borderColor;
  final Color? enableBorderColor;
  final Color? disableBorderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  final double? borderRadius;
  final double? enableBorderRadius;
  final double? disableBorderRadius;
  final double? focusBorderRadius;
  final double? errorBorderRadius;
  final double? borderWidth;
  final double? enableBorderWidth;
  final double? disableBorderWidth;
  final double? focusBorderWidth;
  final double? errorBorderWidth;
  final Color? filledColor;

  const InputDecorationImp(
  { this.borderColor,
    this.enableBorderColor,
    this.disableBorderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    this.borderRadius,
    this.enableBorderRadius,
    this.disableBorderRadius,
    this.focusBorderRadius,
    this.errorBorderRadius,
    this.borderWidth,
    this.enableBorderWidth,
    this.disableBorderWidth,
    this.focusBorderWidth,
    this.errorBorderWidth,
    this.filledColor,}
  );
}
