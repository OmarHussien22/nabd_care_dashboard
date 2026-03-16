import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController? controller;
  final bool? thumbVisibility;
  final bool? trackVisibility;
  final bool? interactive;
  final ScrollbarOrientation? scrollbarOrientation;
  final double? thickness;
  final Radius? radius;
  final Color? thumbColor;
  final Color? trackColor;

  const CustomScrollbar({super.key, required this.child, this.controller, this.thumbVisibility, this.trackVisibility, this.interactive, this.scrollbarOrientation, this.thickness, this.radius, this.thumbColor, this.trackColor});

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(thickness??10),
        radius: const Radius.circular(8),
        thumbColor: WidgetStateProperty.all(thumbColor??AppColors.get.greyLight),
        trackColor: WidgetStateProperty.all(trackColor??AppColors.get.white),
      ),
      child: Scrollbar(
        controller: controller,
        thumbVisibility: thumbVisibility??true,
        trackVisibility: trackVisibility??true,
        interactive: interactive??true,
        scrollbarOrientation: scrollbarOrientation??ScrollbarOrientation.bottom,
        child: child,
      ),
    );
  }
}
