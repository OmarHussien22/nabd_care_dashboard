import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class ChronicDiseaseChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ChronicDiseaseChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 8.toH()),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.get.primary.withOpacity(0.1)
              : AppColors.get.cardFill,
          border: Border.all(
            color: isSelected ? AppColors.get.primary : AppColors.get.greyLight,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              Icon(
                Icons.check_circle,
                size: 16,
                color: AppColors.get.primary,
              ),
            if (isSelected) SizedBox(width: 6.toW()),
            CustomText(
              label,
              fontSize: 13,
              fontWeight: isSelected ? FW.semiBold : FW.regular,
              color: isSelected
                  ? AppColors.get.primary
                  : AppColors.get.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
