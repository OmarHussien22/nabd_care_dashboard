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
  const AddPatientSectionCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.toH()),
      decoration: BoxDecoration(
        color: AppColors.get.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.get.greyLight.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
        border: DashedBorder(
          color: AppColors.get.greyLight.withValues(alpha: .8),
          width: 1.0,
          dashLength: 8.0,
          dashGap: 4.0,
        ),
        // border: Border.all(color: AppColors.get.greyLight, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.toW()),
        child: Column(
          children: [
            AddPatientSectionHeader(
              icon: icon,
              title: title,
            ),
            SizedBox(height: 10.toH()),
            XDivider.normal(height: 1, color: AppColors.get.greyLight),
            SizedBox(height: 10.toH()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
