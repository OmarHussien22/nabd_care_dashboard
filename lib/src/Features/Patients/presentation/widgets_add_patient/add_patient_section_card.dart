import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_section_header.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Spaces&Dividers/custom_divider.dart';
import 'package:dashed_border/dashed_border.dart';
import 'package:flutter/material.dart';

class AddPatientSectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;
  final bool isActive;
  final bool isCollapsed;

  const AddPatientSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
    this.isActive = false,
    this.isCollapsed = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double cardPadding = 16.toW();
    if (screenWidth < 600) {
      cardPadding = 16; // Use fixed 16 on mobile to avoid shrinking too much
    } else if (screenWidth >= 1024) {
      cardPadding = 24; // Use fixed 24 on desktop
    }
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.toH()),
      decoration: BoxDecoration(
        color: isCollapsed
            ? AppColors.get.surfaceContainer.withOpacity(0.5)
            : AppColors.get.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (!isCollapsed)
            BoxShadow(
              color: isActive
                  ? AppColors.get.primary.withOpacity(0.12)
                  : AppColors.get.greyLight.withOpacity(0.4),
              blurRadius: isActive ? 16 : 10,
              offset: Offset(0, isActive ? 4 : 1),
            ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: DashedBorder(
            color: isCollapsed
                ? AppColors.get.border.withOpacity(0.5)
                : isActive
                    ? AppColors.get.primary
                    : AppColors.get.greyLight.withOpacity(0.8),
            width: isActive ? 1.5 : 1.0,
            dashLength: 8.0,
            dashGap: isActive ? 0 : 4.0,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddPatientSectionHeader(
                icon: icon,
                title: title,
                isActive: isActive && !isCollapsed,
              ),
              if (!isCollapsed) ...[
                SizedBox(height: 10.toH()),
                XDivider.normal(
                  height: 1,
                  color: isActive
                      ? AppColors.get.primary.withOpacity(0.2)
                      : AppColors.get.greyLight,
                ),
                SizedBox(height: 12.toH()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
