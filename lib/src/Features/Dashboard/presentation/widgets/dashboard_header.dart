import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  const DashboardHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title,
              fontSize: 24,
              fontWeight: FW.bold,
              color: AppColors.get.textPrimary,
            ),
            if (subtitle != null) ...[
              8.ESH(),
              CustomText(
                subtitle!,
                color: AppColors.get.textSecondary,
                fontSize: 14,
              ),
            ],
          ],
        ),
        if (actions != null) Row(children: actions!),
      ],
    );
  }
}
