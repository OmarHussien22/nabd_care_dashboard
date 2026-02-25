import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart'
    show ScreenSpaces;
import 'package:care_desk/src/Shared/Entities/title_interface.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class ChoiceRadioListTile<T extends TitleInterface> extends StatelessWidget {
  final String? subTitle;
  final Color? titlecolor;
  final double? titleSize;
  final double? subTitleSize;
  final FW? titleFontWeight;
  final Color? subTitleColor;
  final Color? activeColor;
  final Color? hoverColor;
  final ShapeBorder? shape;
  final double? width;
  final T value;
  final T groupValue;
  final Function(T?) onChanged;
  const ChoiceRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.subTitle,
    this.titlecolor,
    this.titleSize,
    this.subTitleSize,
    this.subTitleColor,
    this.activeColor,
    this.hoverColor,
    this.shape,
    this.titleFontWeight,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100.toW(),
      child: RadioListTile<T>(
        title: CustomText(
          value.title,
          fontSize: titleSize,
          color: titlecolor,
          fontWeight: titleFontWeight ?? FW.medium,
        ),
        subtitle: value.subTitle != null
            ? CustomText(
                value.subTitle ?? subTitle ?? "",
                fontSize: subTitleSize,
                color: subTitleColor,
              )
            : null,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: activeColor,
        hoverColor: hoverColor,
        shape: shape,
        overlayColor: WidgetStateProperty.all(
          AppColors.get.primary.withValues(alpha: .1),
        ),
      ),
    );
  }
}
