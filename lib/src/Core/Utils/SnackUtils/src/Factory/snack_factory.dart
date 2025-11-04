import 'package:flutter/material.dart';

import '../Constants/snack_constants.dart';
import '../Object/snack_object.dart';

abstract class SnackObjectFactory {
  final SnackObject object;

  const SnackObjectFactory({
    required this.object,
  });

  SnackObjectFactory copyWith({
    Color? color,
    IconData? icon,
    Color? iconColor,
    Color? titleColor,
    double? titleSize,
    double? messageSize,
    FontWeight? titleFontWeight,
    FontWeight? messageFontWeight,
    Color? bodyColor,
    Duration? appearDuration,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape ,
      SnackBarAction? action,
      SnackBarBehavior? behavior,
      double? elevation,

  }) {
    return _UtilStateCustom(
      newObject: SnackObject(
        color: color ?? object.color,
        icon: icon ?? object.icon,
        iconColor: iconColor ?? object.iconColor,
        titleColor: titleColor ?? object.titleColor,
        titleSize: titleSize ?? object.titleSize,
        titleFontWeight: titleFontWeight ?? object.titleFontWeight,
        messageSize: messageSize ?? object.messageSize,
        messageFontWeight: messageFontWeight ?? object.messageFontWeight,
        messageColor: bodyColor ?? object.messageColor,
        appearDuration: appearDuration ?? object.appearDuration,
        padding: padding ?? object.padding,
        shape: shape ?? object.shape,

        behavior: behavior ?? object.behavior,
        elevation: elevation ?? object.elevation,
      ),
    );
  }
}

class SnackObjectCreator {
  SnackObjectCreator._();

  factory SnackObjectCreator() => _instance;
  static final SnackObjectCreator _instance = SnackObjectCreator._();

  SnackObjectFactory get(UtilState state) {
    switch (state) {
      case UtilState.success:
        return const _UtilStateSuccess();
      case UtilState.warning:
        return const _UtilStateWarning();
      case UtilState.error:
        return const _UtilStateError();
      case UtilState.none:
        return const _UtilStateNone();
    }
  }
}

class _UtilStateSuccess extends SnackObjectFactory {
  const _UtilStateSuccess()
      : super(
          object: const SnackObject(
            color: SnackConstants.successColor,
            messageColor: SnackConstants.successMessageColor,
            icon: SnackConstants.successIcon,
            iconColor: SnackConstants.successIconColor,
            titleColor: SnackConstants.successTitleColor,
            titleSize: SnackConstants.successTitleSize,
            titleFontWeight: SnackConstants.successTitleFontWeight,
            messageSize: SnackConstants.successMessageSize,
            messageFontWeight: SnackConstants.successMessageFontWeight,
          ),
        );
}

class _UtilStateWarning extends SnackObjectFactory {
  const _UtilStateWarning()
      : super(
          object: const SnackObject(
            color: SnackConstants.warningColor,
            messageColor: SnackConstants.warningMessageColor,
            icon: SnackConstants.warningIcon,
            iconColor: SnackConstants.warningIconColor,
            titleColor: SnackConstants.warningTitleColor,
            titleSize: SnackConstants.warningTitleSize,
            titleFontWeight: SnackConstants.warningTitleFontWeight,
            messageSize: SnackConstants.warningMessageSize,
            messageFontWeight: SnackConstants.warningMessageFontWeight,
          ),
        );
}

class _UtilStateError extends SnackObjectFactory {
  const _UtilStateError()
      : super(
          object: const SnackObject(
            color: SnackConstants.errorColor,
            messageColor: SnackConstants.errorMessageColor,
            icon: SnackConstants.errorIcon,
            iconColor: SnackConstants.errorIconColor,
            titleColor: SnackConstants.errorTitleColor,
            titleSize: SnackConstants.errorTitleSize,
            titleFontWeight: SnackConstants.errorTitleFontWeight,
            messageSize: SnackConstants.errorMessageSize,
            messageFontWeight: SnackConstants.errorMessageFontWeight,
          ),
        );
}

class _UtilStateNone extends SnackObjectFactory {
  const _UtilStateNone()
      : super(
          object: const SnackObject(
            color: SnackConstants.noneColor,
            messageColor: SnackConstants.noneMessageColor,
            icon: SnackConstants.noneIcon,
            iconColor: SnackConstants.noneIconColor,
            titleColor: SnackConstants.noneTitleColor,
            titleSize: SnackConstants.noneTitleSize,
            titleFontWeight: SnackConstants.noneTitleFontWeight,
            messageSize: SnackConstants.noneMessageSize,
            messageFontWeight: SnackConstants.noneMessageFontWeight,
          ),
        );
}

class _UtilStateCustom extends SnackObjectFactory {
  final SnackObject newObject;

  const _UtilStateCustom({
    required this.newObject,
  }) : super(object: newObject);
}
