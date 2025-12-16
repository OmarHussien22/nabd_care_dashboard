import 'package:care_desk/src/Core/Utils/SnackUtils/src/Constants/snack_constants.dart';
import 'package:care_desk/src/Core/Utils/SnackUtils/src/Factory/snack_factory.dart';
import 'package:care_desk/src/Core/Utils/SnackUtils/src/Interface/snack_interface.dart';
import 'package:care_desk/src/Core/Utils/SnackUtils/src/Object/snack_object.dart';
import 'package:care_desk/src/Core/Utils/SnackUtils/src/Resources/Snack/snackbar_imp.dart';
import 'package:flutter/material.dart';

// AppSnacks.showSnack(); // snap snack - - native snack
// AppSnacks.showActionSnack(); // snap snack - native snack

class AppSnacks {
  AppSnacks._();

  factory AppSnacks() => _instance;
  static final _instance = AppSnacks._();

  final SnackInterface _snack = SnackBarImp();

  void showSnack({
    String? title,
    String? body,
    Widget? content,
    SnackObject? snackObject,
    UtilState state = UtilState.none,
    Color? backGroundColor,
  }) {
    final object = snackObject ?? SnackObjectCreator().get(state).object;
    _snack.showSnack(
        title: title,
        content: content,
        message: body,
        snackObject: object,
        state: state,
        backGroundColor: backGroundColor);
  }

  void showActionSnack(
      {String? title,
      String? body,
      Widget? content,
      SnackObject? snackObject,
      UtilState state = UtilState.none,
      required GestureTapCallback onMainPressed,
      String actionText = SnackConstants.mainActionText,
      Color actionTextColor = SnackConstants.actionTextColor,
      Color actionBackgroundColor = SnackConstants.actionDisabledTextColor,
      Color? backGroundColor}) {
    final object = snackObject ?? SnackObjectCreator().get(state).object;
    _snack.showActionSnack(
      onMainPressed: onMainPressed,
      title: title,
      body: body,
      content: content,
      snackObject: object,
      state: state,
      actionText: actionText,
      actionDisabledTextColor: actionBackgroundColor,
      actionTextColor: actionTextColor,
    );
  }
}
