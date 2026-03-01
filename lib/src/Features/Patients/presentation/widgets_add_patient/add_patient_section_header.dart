import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';

class AddPatientSectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;

  const AddPatientSectionHeader({
    super.key,
    required this.icon,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(8.toW()),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.get.primary.withOpacity(0.12)
                : AppColors.get.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color:
                isActive ? AppColors.get.primary : AppColors.get.textSecondary,
            size: 20,
          ),
        ),
        SizedBox(width: 12.toW()),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isActive ? AppColors.get.primary : AppColors.get.textPrimary,
            fontFamily: 'cairo',
          ),
          child: Text(title),
        ),
      ],
    );
  }
}
