import 'package:getx_base_code/src/Core/Libraries/snap/snap.dart';
import 'package:flutter/material.dart';

import 'snack_bar.dart';

extension ExtensionSnacks on SnapInterface {
  /// show snacknbar
  void showSnack(final SnackBar snack) =>
      messengerKey.currentState?.showSnackBar(snack);

  /// show default snack

  void showDefaultSnack({
    final String? title,
    final Widget? content,
    final double? titleSize,
    final FontWeight? titleWeight,
    final Color? titleColor,
    final String? message,
    final double? messageSize,
    final FontWeight? messageWeight,
    final Color? messageColor,
    final Color? backgroundColor,
    final EdgeInsetsGeometry? padding,
    final ShapeBorder? shape,
    final SnackBarAction? action,
    final SnackBarBehavior? behavior,
    final Duration? duration,
  }) {
    if (isSnackShown) {
      closeAllSnacks();
    }
    showSnack(
      SnapSnack(
        title: title,
        content: content,
        titleSize: titleSize,
        titleWeight: titleWeight,
        titleColor: titleColor,
        message: message,
        messageSize: messageSize,
        messageWeight: messageWeight,
        messageColor: messageColor,
        action: action,
        backgroundColor: backgroundColor,
        padding: padding,
        shape: shape,
        behavior: behavior,
        duration: duration,
      ).build(),
    );
  }

  /// is shown
  bool get isSnackShown => messengerKey.currentState?.mounted ?? false;

  /// Close snack
  void closeCurrentSnack() => messengerKey.currentState?.hideCurrentSnackBar();

  ///  Close All Snack
  void closeAllSnacks() => messengerKey.currentState?.clearSnackBars();
}
