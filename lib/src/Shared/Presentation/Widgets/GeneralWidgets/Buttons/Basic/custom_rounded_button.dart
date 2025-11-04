import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
import '../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../Spaces&Dividers/spaces.dart';
import '../../Text/custom_text_lib.dart';

class ButtonDefault extends StatefulWidget {
  final Widget? child;
  final String? title;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? titleColor;
  final Color? disabledColor;
  final Color? color;
  final VoidCallback? onPressed;
  final double elevation;
  final double? height;
  final double? borderRadius;
  final double? width;
  final double? titleSize;
  final bool isDisabled;
  final EdgeInsetsGeometry? padding;
  final String tooltip;

  const ButtonDefault({

    super.key,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.disabledColor,
    this.color = Colors.white,
    this.onPressed,
    this.elevation = 1.0,
    this.padding,
    this.child,
    this.tooltip = '',
    this.isDisabled = false,
    this.height,
    this.width,
    this.title,
    this.titleColor = Colors.white,
    this.titleSize = 6,
    this.borderRadius,
  });

  @override
  State<ButtonDefault> createState() => _ButtonDefaultState();

  // --------------------------------------------------------------------------
  // Factory methods remain unchanged (icon + image)
  // --------------------------------------------------------------------------
  factory ButtonDefault.icon({
    required final String label,
    required final IconData icon,
    final Color? backgroundColor,
    final Color? disabledBackgroundColor,
    final Color? disabledColor = Colors.white70,
    final Color? color = Colors.white,
    final VoidCallback? onPressed,
    final bool isDisabled = false,
    final bool isUpperCase = false,
    final String tooltip = '',
  }) =>
      ButtonDefault(
        tooltip: tooltip,
        onPressed: onPressed,
        isDisabled: isDisabled,
        color: color,
        disabledColor: disabledColor,
        disabledBackgroundColor: disabledBackgroundColor,
        backgroundColor: backgroundColor ?? AppColors.get.primary,
        child: _IconRoundedChild(
          color: color,
          label: label.toTr(),
          icon: icon,
          isUpperCase: isUpperCase,
        ),
      );

  factory ButtonDefault.image({
    required final String label,
    required final ImageProvider image,
    final double side = 25,
    final Color? backgroundColor,
    final Color? disabledBackgroundColor = Colors.black12,
    final Color? disabledColor = Colors.white70,
    final double? height,
    final Color? color = Colors.white,
    final VoidCallback? onPressed,
    final bool isDisabled = false,
    final bool isUpperCase = false,
    final EdgeInsetsGeometry? padding,
    final String tooltip = '',
  }) =>
      ButtonDefault(
        padding: padding,
        tooltip: tooltip,
        onPressed: onPressed,
        height: height,
        isDisabled: isDisabled,
        color: color,
        disabledColor: disabledColor,
        disabledBackgroundColor: disabledBackgroundColor,
        backgroundColor: backgroundColor ?? AppColors.get.primary,
        child: _ImageRoundedChild(
          label: label,
          image: image,
          color: color,
          side: side,
          isUpperCase: isUpperCase,
        ),
      );
}

class _ButtonDefaultState extends State<ButtonDefault> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final baseColor = widget.backgroundColor ?? AppColors.get.primary;
    final hoverColor = baseColor.withOpacity(0.85);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor:
          widget.isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: _isHovered && !widget.isDisabled ? 1.03 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((widget.borderRadius ?? 15).toRad()),
            boxShadow: _isHovered && !widget.isDisabled
                ? [
                    BoxShadow(
                      color: baseColor.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: IgnorePointer(
            ignoring: widget.isDisabled,
            child: SizedBox(
              width: widget.width ?? double.infinity,
              height: widget.height ?? 45.toH(),
              child: CupertinoButton(
                padding: widget.padding ?? EdgeInsets.zero,
                color: _isHovered && !widget.isDisabled ? hoverColor : baseColor,
                disabledColor: widget.disabledColor ??
                    AppColors.get.primary.withOpacity(0.5),
                borderRadius:
                    BorderRadius.circular((widget.borderRadius ?? 15).toRad()),
                minSize: widget.height,
                onPressed: widget.isDisabled ? null : widget.onPressed,
                child: widget.tooltip.isNotEmpty
                    ? Tooltip(
                        message: widget.tooltip,
                        child: widget.child ??
                            CustomText(
                              "${widget.title}",
                              fontSize: widget.titleSize,
                              fontWeight: FW.regular,
                              color: widget.titleColor,
                            ),
                      )
                    : widget.child ??
                        CustomText(
                          "${widget.title}",
                          fontSize: widget.titleSize,
                          fontWeight: FW.regular,
                          color: widget.titleColor,
                        ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =============================== SUB COMPONENTS ==============================

class _IconRoundedChild extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final bool isUpperCase;

  const _IconRoundedChild({
    super.key,
    required this.label,
    required this.icon,
    this.color,
    required this.isUpperCase,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        10.ESW(),
        Text(
          isUpperCase ? label.toUpperCase() : label,
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.titleMedium?.copyWith(color: color),
        ),
      ],
    );
  }
}

class _ImageRoundedChild extends StatelessWidget {
  final String label;
  final ImageProvider image;
  final Color? color;
  final bool isUpperCase;
  final double side;

  const _ImageRoundedChild({
    super.key,
    required this.label,
    required this.image,
    this.color,
    required this.isUpperCase,
    required this.side,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: image, width: side, height: side),
        XSpace.light,
        CustomText(
          isUpperCase ? label.toUpperCase() : label,
          textAlign: TextAlign.center,
          color: color,
          fontSize: 12,
          fontWeight: FW.medium,
        ),
      ],
    );
  }
}
