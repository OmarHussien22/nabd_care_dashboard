import 'package:flutter/material.dart';
import '../../../../../../../../../Core/Libraries/snap/snap.dart';
import '../../../../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../../Buttons/Basic/button_close.dart';
import '../Interface/sheet_header_interface.dart';
import '../Options/sheet_header_option.dart';
import '../../../Utils/Constants/sheet_constants.dart';
import '../../../../../Text/custom_text_lib.dart';

class SheetHeaderBasic extends SheetHeaderInterface {
  final String title;
  final Widget? action;
  final Widget? closeAction;
  final VoidCallback? onClose;
  SheetHeaderOptions? options;
  SheetHeaderBasic({
    super.key,
    this.title = '',
    this.action,
    this.options,
    this.closeAction,
    this.onClose,
  }) {
    options ??= SheetHeaderOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SheetConstants.get.headerPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          closeAction ?? ButtonClose(onTap: onClose ?? () => Snap.back()),
          CustomText(
            title,
            fontSize: SheetConstants.get.headerTextSize,
            fontWeight: SheetConstants.get.headerTextWeight,
          ),
          action ?? 0.ESW(),
        ],
      ),
    );
  }
}
