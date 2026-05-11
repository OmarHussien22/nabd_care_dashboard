import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ViewAllButton({
    super.key,
    this.label = "View All",
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.toRad()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.toW(), vertical: 8.toH()),
        decoration: BoxDecoration(
          color: AppColors.get.primary.withOpacity(0.06),
          borderRadius: BorderRadius.circular(10.toRad()),
          border: Border.all(color: AppColors.get.primary.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              label,
              fontSize: 12.5,
              fontWeight: FW.bold,
              color: AppColors.get.primary,
            ),
            8.ESW(),
            Icon(
              Icons.arrow_forward_rounded,
              size: 14,
              color: AppColors.get.primary,
            ),
          ],
        ),
      ),
    );
  }
}
