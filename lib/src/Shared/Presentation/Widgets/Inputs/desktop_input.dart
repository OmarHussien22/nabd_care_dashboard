import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/src/Default/Components/Decoration/Abstract/input_decoration_imp.dart';
import 'package:flutter/material.dart';

class DesktopInput extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool isPassword;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final int maxLines;
  final double? verticalPadding;
  const DesktopInput({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.maxLines = 1,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldDefault(
      controller: controller,
      // horizontalPadding: 8,
      // surroundingPadding: const EdgeInsets.symmetric(vertical: 4),
      verticalPadding: verticalPadding ?? 6,
      maxLines: maxLines,
      header: TFFHeader(title: label, fontSize: 13),
      hint: TFFHint(title: hint),
      enable: true,
      suffix: suffixIcon != null
          ? SuffixWithIconData(iconData: suffixIcon!)
          : const SuffixNone(),
      prefix: prefixIcon != null
          ? PrefixWithIconData(iconData: prefixIcon!, scale: 1)
          : const PrefixNone(),
      cursorColor: AppColors.get.textPrimary,
      inputDecoration: InputDecorationWithBorder(
        borderColor: AppColors.get.greyLight,
        enableBorderColor: AppColors.get.greyLight,
      ),
    );
  }
}
