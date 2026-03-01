import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientButtons extends StatelessWidget {
  final AddPatientBuilder cnt;
  const AddPatientButtons({super.key, required this.cnt});

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      styles: WrapAnimationStyles.fade,
      durationStyle: WrapDurationStyle.fast,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.get.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.get.greyLight.withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, -3),
            ),
          ],
          border: Border(
            top: BorderSide(color: AppColors.get.border, width: 1),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.toW(),
            vertical: 14.toH(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: info hint
              Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 16,
                    color: AppColors.get.red,
                  ),
                  SizedBox(width: 6.toW()),
                  CustomText(
                    'all_fields_marked_required'.toTr(),
                    fontSize: 12,
                    color: AppColors.get.red,
                  ),
                ],
              ),

              // Right: action buttons
              Row(
                children: [
                  // Cancel / Discard
                  _FooterButton(
                    label: 'cancel'.toTr(),
                    icon: Icons.close_rounded,
                    isPrimary: false,
                    onTap: () => Get.back(),
                  ),
                  SizedBox(width: 12.toW()),

                  // Save Draft
                  _FooterButton(
                    label: 'save_draft'.toTr(),
                    icon: Icons.bookmark_border_rounded,
                    isPrimary: false,
                    accent: true,
                    onTap: () {
                      // TODO: save draft logic
                    },
                  ),
                  SizedBox(width: 12.toW()),

                  // Submit / Register
                  _FooterButton(
                    label: 'register_patient'.toTr(),
                    icon: Icons.check_circle_outline_rounded,
                    isPrimary: true,
                    onTap: () {
                      if (cnt.globalKey.currentState?.validate() ?? false) {
                        cnt.globalKey.currentState?.save();
                        // TODO: submit logic
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final bool accent;
  final VoidCallback onTap;

  const _FooterButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
    this.accent = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = isPrimary
        ? AppColors.get.primary
        : accent
            ? AppColors.get.primary.withOpacity(0.08)
            : AppColors.get.surfaceContainer;

    final Color fg = isPrimary
        ? Colors.white
        : accent
            ? AppColors.get.primary
            : AppColors.get.textSecondary;

    final Color borderColor =
        accent ? AppColors.get.primary.withOpacity(0.3) : AppColors.get.border;

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(10),
      // borders: isPrimary ? null : Border.all(color: borderColor, width: 1),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        hoverColor: isPrimary
            ? AppColors.get.primaryDark.withOpacity(0.15)
            : AppColors.get.primary.withOpacity(0.06),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.toW(),
            vertical: 10.toH(),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: fg),
              SizedBox(width: 6.toW()),
              CustomText(
                label,
                fontSize: 13,
                fontWeight: FW.medium,
                color: fg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
