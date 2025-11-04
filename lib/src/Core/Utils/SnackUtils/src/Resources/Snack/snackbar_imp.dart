import 'package:getx_base_code/src/Core/Libraries/snap/src/snap_main.dart';
import 'package:getx_base_code/src/Core/Libraries/snap/src/snap_overlay/src/Snack/snak_extension.dart';
import 'package:flutter/material.dart';

import '../../Constants/snack_constants.dart';
import '../../Interface/snack_interface.dart';
import '../../Object/snack_object.dart';
import 'snack_bar_behaviour.dart';

class SnackBarImp extends SnackInterface with SnackBarBehaviour {
  @override
  void showSnack(
      {String? title,
      String? message,
      Widget? content,
      SnackObject? snackObject,
      UtilState? state,
      Color? backGroundColor}) {
    Snap.showDefaultSnack(
      title: title,
      titleSize: snackObject?.titleSize,
      titleColor: snackObject?.titleColor,
      titleWeight: snackObject?.titleFontWeight,
      message: message,
      messageSize: snackObject?.messageSize,
      messageColor: snackObject?.messageColor,
      messageWeight: snackObject?.messageFontWeight,
      content: content,
      backgroundColor: snackObject?.color,
      duration: snackObject?.appearDuration,
      shape: snackObject?.shape,
      padding: snackObject?.padding,
      behavior: snackObject?.behavior,
    );
  }

  @override
  void showActionSnack(
      {String? title,
      String? body,
      Widget? content,
      SnackObject? snackObject,
      UtilState? state,
      required GestureTapCallback onMainPressed,
      String? actionText,
      Color? actionTextColor,
      Color? actionDisabledTextColor,
      Color? backGroundColor}) {
    Snap.showDefaultSnack(
      title: title,
      titleSize: snackObject?.titleSize,
      titleColor: snackObject?.titleColor,
      titleWeight: snackObject?.titleFontWeight,
      message: body,
      messageSize: snackObject?.messageSize,
      messageColor: snackObject?.messageColor,
      messageWeight: snackObject?.messageFontWeight,
      content: content,
      backgroundColor: snackObject?.color,
      duration: snackObject?.appearDuration,
      shape: snackObject?.shape,
      padding: snackObject?.padding,
      behavior: snackObject?.behavior,
      action: SnackBarAction(
        label: actionText ?? SnackConstants.mainActionText,
        onPressed: onMainPressed,
        textColor: actionTextColor,
        disabledTextColor: actionDisabledTextColor,
      ),
    );
  }
}
