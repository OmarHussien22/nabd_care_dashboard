import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';

import '../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../Core/Utils/Extensions/basic_op_extensions.dart';
import '../../../../../Core/Utils/Validation/app_validator.dart';
import 'Default/default_text_field.dart';

class AppFillTextFieldField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final String? hint;
  final String? header;
  final String? prefixAsset;
  final double? prefixScale;
  final IconData? prefixIconData;
  final VoidCallback? onTap;
  final bool readOnly;
  final VoidCallback? onComplete;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool isSheet;
  final double? fontSizeHint;
  final double? fontSizeHeader;
  final double? width;
  final double? verticalPadding;
  final double? horizontalPadding;
  final EdgeInsets? surroundingPadding;
  const AppFillTextFieldField({
    super.key,
    this.controller,
    this.validation,
    this.hint,
    this.header,
    this.prefixAsset,
    this.prefixScale = 1.8,
    this.prefixIconData,
    this.onTap,
    this.keyboardType,
    this.readOnly = false,
    this.isSheet = false,
    this.onComplete,
    this.fontSizeHint,
    this.fontSizeHeader,
    this.maxLines = 1,
    this.width,
    this.verticalPadding,
    this.horizontalPadding,
    this.surroundingPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldDefault(
      verticalPadding: verticalPadding ?? 14.toH(),
      horizontalPadding: horizontalPadding ?? 14.toW(),
      surroundingPadding: surroundingPadding ?? EdgeInsets.zero,
      width: width ?? MediaQuery.of(context).size.width * 0.4,
      keyboardType: keyboardType,
      fillColor: AppColors.get.greyLight,
      inputDecoration: InputDecorationWithBorder(
        enableBorderColor: AppColors.get.greyLight,
      ),
      validation: AppValidator.defaultValidator.validate,
      controller: controller,
      hint: TFFHint(
        title: hint?.toTr(),
        fontSize: fontSizeHint,
      ),
      maxLines: maxLines,
      header: TFFHeader(title: header?.toTr(), fontSize: fontSizeHeader),
      prefix: prefixAsset != null
          ? PrefixWithIconImage(
              scale: prefixScale,
              iconImage: prefixAsset.noneNull,
              color: AppColors.get.primary,
            )
          : prefixIconData != null
              ? PrefixWithIconData(
                  scale: prefixScale,
                  iconData: prefixIconData ?? Icons.person,
                  color: AppColors.get.primary,
                )
              : const PrefixNone(),
      suffix: isSheet
          ? SuffixWithIconData(
              iconData: Icons.keyboard_arrow_down,
            )
          : const SuffixNone(),
      readOnly: isSheet ? true : readOnly,
      onTap: onTap,
      onComplete: onComplete,
    );
  }
}
