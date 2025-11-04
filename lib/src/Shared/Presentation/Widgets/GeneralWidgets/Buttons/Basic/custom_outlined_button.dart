import 'package:flutter/material.dart';

import '../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../Spaces&Dividers/spaces.dart';
import '../../Text/custom_text_lib.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final double? titleSize;
  final Color? titleColor;

  final Widget? child;
  final bool isEnabled;
  final bool isCurvedBorders;
  final Color? backgroundColor;
  final Color? primaryColor;
  final String tooltip;
  final double? height;
  final double? width;
  final EdgeInsets? innerPadding;
  final double? radius;
  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    this.child,
    this.isCurvedBorders = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.primaryColor,
    this.tooltip = '',
    this.height,
    this.width,
    this.innerPadding,
    this.radius,
    this.title,
    this.titleColor,
    this.titleSize = 14,
  });

  /// icon constructor ---------------------------------------------------------

  factory CustomOutlinedButton.icon({
    Key? key,
    required String label,
    required IconData icon,
    VoidCallback? onPressed,
    bool isEnabled = true,
    bool isCurvedBorders = false,
    bool isUpperCase = false,
    Color? backgroundColor,
    Color? primaryColor,
    Color? innerColor,
    String tooltip = '',
  }) =>
      CustomOutlinedButton(
        key: key,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        isCurvedBorders: isCurvedBorders,
        isEnabled: isEnabled,
        tooltip: tooltip,
        primaryColor: primaryColor,
        child: _IconOutlinedChild(
          label: label,
          icon: icon,
          color: innerColor ?? AppColors.get.primary,
          isUpperCase: isUpperCase,
        ),
      );

  /// image constructor --------------------------------------------------------
  factory CustomOutlinedButton.image({
    Key? key,
    required String label,
    required ImageProvider image,
    VoidCallback? onPressed,
    bool isEnabled = true,
    bool isCurvedBorders = false,
    bool isUpperCase = false,
    Color? backgroundColor,
    Color? primaryColor,
    Color? innerColor,
    String tooltip = '',
    double side = 20,
    double? height,
  }) =>
      CustomOutlinedButton(
        key: key,
        height: height,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        isCurvedBorders: isCurvedBorders,
        isEnabled: isEnabled,
        tooltip: tooltip,
        primaryColor: primaryColor,
        child: _ImageOutlinedChild(
          key: key,
          label: label,
          image: image,
          side: side,
          color: innerColor ?? AppColors.get.primary,
          isUpperCase: isUpperCase,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        key: key,
        onPressed: isEnabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          // primary: primaryColor,
          shadowColor: primaryColor?.withOpacity(0.1),
          side: BorderSide(
            width: 1,
            color: primaryColor ?? backgroundColor ?? AppColors.get.primary,
          ),
          shape: isCurvedBorders
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(radius ?? 50.0.toRad()),
                ))
              : RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(10.0.toRad()),
                )),
          backgroundColor: backgroundColor,
        ),
        child: tooltip != ''
            ? Tooltip(
                message: tooltip,
                child: child ??
                    CustomText(
                      "$title",
                      fontSize: titleSize,
                      fontWeight: FW.regular,
                      color: titleColor ?? AppColors.get.title,
                    ),
              )
            : child ??
                CustomText(
                  "$title",
                  fontSize: titleSize,
                  fontWeight: FW.regular,
                  color: titleColor ?? AppColors.get.title,
                ),
        // child: tooltip !=''? Padding(
        //   padding: innerPadding?? EdgeInsets.zero,
        //   child: Tooltip(
        //       message: tooltip,
        //       child: child,
        //   ),
        // ): Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //   child: child,
        // ),
      ),
    );
  }
}

class _IconOutlinedChild extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final bool isUpperCase;

  const _IconOutlinedChild({
    super.key,
    required this.icon,
    required this.label,
    this.color,
    required this.isUpperCase,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Expanded(
          child: Text(
            isUpperCase ? label.toUpperCase() : label,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}

class _ImageOutlinedChild extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final Color? color;
  final bool isUpperCase;
  final double side;

  const _ImageOutlinedChild({
    super.key,
    required this.image,
    required this.label,
    this.color,
    required this.isUpperCase,
    required this.side,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isUpperCase ? label.toUpperCase() : label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: color,
                fontSize: 12,
              ),
        ),
        XSpace.normal,
        Image(
          image: image,
          width: side,
          height: side,
        ),
      ],
    );
  }
}
