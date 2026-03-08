import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

/// A compact "completed" banner shown above the active step card.
/// Displays the step's icon, title, a green ✓ "Filled" badge,
/// and a mushroom (🍄) icon as a playful done indicator.
class AddPatientCompletedCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onEdit;

  const AddPatientCompletedCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12.toH()),
      padding: EdgeInsets.symmetric(
        horizontal: 18.toW(),
        vertical: 12.toH(),
      ),
      decoration: BoxDecoration(
        color: AppColors.get.green.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.get.green.withOpacity(0.35),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.get.green.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Step icon (completed style) ──
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.get.green.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 20,
              color: AppColors.get.green,
            ),
          ),
          SizedBox(width: 14.toW()),

          // ── Title + "Filled" label ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title,
                  fontSize: 14,
                  fontWeight: FW.semiBold,
                  color: AppColors.get.textPrimary,
                ),
                SizedBox(height: 3.toH()),
                Row(
                  children: [
                    // Mushroom icon (done indicator)
                    Text(
                      '🍄',
                      style: TextStyle(fontSize: 13.toW()),
                    ),
                    SizedBox(width: 4.toW()),
                    CustomText(
                      'filled'.toTr(),
                      fontSize: 12,
                      fontWeight: FW.medium,
                      color: AppColors.get.green,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ── Filled badge ──────────────────
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.toW(),
              vertical: 4.toH(),
            ),
            decoration: BoxDecoration(
              color: AppColors.get.green.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.get.green.withOpacity(0.4),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  size: 14,
                  color: AppColors.get.green,
                ),
                SizedBox(width: 4.toW()),
                CustomText(
                  'completed'.toTr(),
                  fontSize: 11,
                  fontWeight: FW.semiBold,
                  color: AppColors.get.green,
                ),
              ],
            ),
          ),
          SizedBox(width: 12.toW()),

          // ── Edit button ──────────────────
          Material(
            color: AppColors.get.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onEdit,
              hoverColor: AppColors.get.primary.withOpacity(0.06),
              child: Padding(
                padding: EdgeInsets.all(7.toW()),
                child: Icon(
                  Icons.edit_rounded,
                  size: 16,
                  color: AppColors.get.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
