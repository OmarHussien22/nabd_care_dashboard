import 'dart:ui';

import 'package:flutter/src/gestures/tap.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_base_code/src/Core/Utils/SnackUtils/src/Constants/snack_constants.dart';
import 'package:getx_base_code/src/Core/Utils/SnackUtils/src/Object/snack_object.dart';

import '../../Interface/snack_interface.dart';

class ToastImp extends SnackInterface {
  @override
  void showSnack(
      {String? title,
      String? message,
      Widget? content,
      SnackObject? snackObject,
      Color? backGroundColor,
      UtilState state = UtilState.none}) {
    // TODO: implement showDefaultSnack
  }

  @override
  void showActionSnack({
    String? title,
    String? body,
    Widget? content,
    SnackObject? snackObject,
    UtilState? state,
    required GestureTapCallback onMainPressed,
    String? actionText,
    Color? actionTextColor,
    Color? actionDisabledTextColor,
    Color? backGroundColor,
  }) {
    // TODO: implement showActionSnack
  }
}
