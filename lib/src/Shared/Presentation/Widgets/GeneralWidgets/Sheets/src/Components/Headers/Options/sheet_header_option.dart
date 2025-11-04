import 'package:flutter/material.dart';
import '../../../Utils/Constants/sheet_constants.dart';
import '../../../../../Text/custom_text_lib.dart';

class SheetHeaderOptions {
  EdgeInsets? padding;
  double? textSize;
  Color? textColor;
  FW? textWeight;

  SheetHeaderOptions({
    this.padding,
    this.textSize,
    this.textWeight,
    this.textColor,
  }) {
    padding ??= SheetConstants.get.headerPadding;
    textSize ??= SheetConstants.get.headerTextSize;
    textWeight ??= SheetConstants.get.headerTextWeight;
    textColor ??= SheetConstants.get.headerTextColor;
  }

// factory SheetHeaderOptions.basic() =>   SheetHeaderOptions(
//       padding: SheetConstants.get.headerPadding,
//       textSize: SheetConstants.get.headerTextSize,
//       textWeight: SheetConstants.get.headerTextWeight,
//       textColor: SheetConstants.get.headerTextColor,
//     );
}
