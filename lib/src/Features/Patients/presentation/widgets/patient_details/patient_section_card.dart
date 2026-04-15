import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class PatientSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const PatientSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.toW()),
      decoration: BoxDecoration(
        color: AppColors.get.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.get.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.get.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.get.primary, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomText(
                  title,
                  fontSize: 17,
                  fontWeight: FW.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.toH()),
          child,
        ],
      ),
    );
  }
}

