import 'package:flutter/material.dart';

/// Build a [SnackBar] with all possible options.
class SnapSnack {
  final String? title;
  final Widget? content;
  final double? titleSize;
  final FontWeight? titleWeight;
  final Color? titleColor;
  final String? message;
  final double? messageSize;
  final FontWeight? messageWeight;
  final Color? messageColor;
  final SnackBarAction? action;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final SnackBarBehavior? behavior;
  final Duration? duration;

  SnapSnack({
    Key? key,
    this.content,
    this.title,
    this.titleSize,
    this.titleWeight,
    this.titleColor,
    this.message,
    this.messageSize,
    this.messageWeight,
    this.messageColor,
    this.action,
    this.backgroundColor,
    this.padding,
    this.shape,
    this.behavior,
    this.duration,
  });
  //: assert(title != null || content != null);

  SnackBar build() {
    final title = this.title ?? "";
    return SnackBar(
      content: content ??
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title.isNotEmpty)
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor ?? Colors.white,
                    fontSize: titleSize ?? 16,
                    fontWeight: titleWeight ?? FontWeight.w600,
                  ),
                ),
              if (message != null && (message ?? "").isNotEmpty)
                Text(
                  message ?? "",
                  style: TextStyle(
                    color: messageColor ?? Colors.white,
                    fontSize: messageSize ?? 14,
                    fontWeight: messageWeight ?? FontWeight.w400,
                  ),
                ),
            ],
          ),
      behavior: behavior ?? SnackBarBehavior.floating,
      duration: duration ?? const Duration(seconds: 3),
      action: action,
      backgroundColor: backgroundColor ?? Colors.black,
      padding: padding ?? const EdgeInsets.all(16),
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
    );
  }
}

// class SnapSnack extends SnackBar {
//   final String title;
//
//   const SnapSnack({
//     super.key,
//     required super.content,
//     required this.title,
//   });
//
//   @override
//   Widget get content => SnackBar(
//     content: Text(
//       title,
//       style: const TextStyle(color: Colors.black),
//     ),
//     action: action,
//     duration: duration ?? const Duration(seconds: 3),
//     backgroundColor: backgroundColor,
//     elevation: elevation,
//     shape: shape,
//     behavior: behavior,
//     padding: padding,
//     width: double.infinity,
//     clipBehavior: Clip.antiAlias,
//     margin: margin ?? const EdgeInsets.all(8),
//   );
// }
