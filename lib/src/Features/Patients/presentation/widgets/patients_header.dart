import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class PatientsHeader extends StatelessWidget {
  const PatientsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomText(
      "Patients Directory",
      fontSize: 20,
      fontWeight: FW.bold,
      color: AppColors.get.textPrimary,
    );
  }
}
