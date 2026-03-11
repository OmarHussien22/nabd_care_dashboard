
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({super.key, 
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 12.toH()),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.get.primary.withOpacity(0.05)
              : AppColors.get.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.get.primary : AppColors.get.greyLight,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected
                  ? AppColors.get.primary
                  : AppColors.get.textSecondary,
            ),
            SizedBox(width: 8.toW()),
            CustomText(
              label,
              fontSize: 14,
              fontWeight: isSelected ? FW.bold : FW.medium,
              color: isSelected
                  ? AppColors.get.primary
                  : AppColors.get.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
