import 'package:getx_base_code/src/Core/Utils/SnackUtils/src/Constants/snack_constants.dart';
import 'package:getx_base_code/src/Core/Utils/SnackUtils/src/Object/snack_object.dart';
import 'package:flutter/material.dart';

abstract class SnackInterface {
  void showSnack({
    String? title,
    String? message,
    Widget? content,
    SnackObject? snackObject,
    UtilState state,
    Color? backGroundColor,
  });

  void showActionSnack({
    String? title,
    String? body,
    Widget? content,
    SnackObject? snackObject,
    UtilState state,
    required GestureTapCallback onMainPressed,
    String actionText,
    Color? actionTextColor,
    Color? actionDisabledTextColor,
    Color? backGroundColor,
  });
}
