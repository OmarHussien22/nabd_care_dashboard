import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class ContactInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactInfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.get.surfaceContainer.withOpacity(0.35),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.get.border.withOpacity(0.6)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.get.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 18, color: AppColors.get.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  label,
                  fontSize: 12,
                  fontWeight: FW.semiBold,
                  color: AppColors.get.textSecondary,
                ),
                const SizedBox(height: 4),
                CustomText(
                  value,
                  fontSize: 14,
                  fontWeight: FW.medium,
                  maxLines: 2,
                  isOverFlow: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

