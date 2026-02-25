import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class AddPatientSectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  const AddPatientSectionHeader(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.toW()),
          decoration: BoxDecoration(
            color: AppColors.get.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.get.primary, size: 20),
        ),
        SizedBox(width: 12.toW()),
        CustomText(
          title,
          fontSize: 16,
          fontWeight: FW.semiBold,
          color: AppColors.get.textPrimary,
        ),
      ],
    );
  }
}
