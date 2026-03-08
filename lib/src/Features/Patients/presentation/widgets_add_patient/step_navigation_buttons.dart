import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepNavigationButtons extends StatelessWidget {
  /// Label shown on the forward button. If null, shows "submit".
  final String? nextStepLabel;

  /// Called when the forward button is tapped.
  final VoidCallback onNext;

  /// Whether this is the last step (changes button style + label).
  final bool isLastStep;
  final VoidCallback onBack;
  const StepNavigationButtons({
    super.key,
    this.nextStepLabel,
    required this.onNext,
    this.isLastStep = false,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.toH()),
      child: Row(
        children: [
          // ── Return to Main ──────────────────────────
          _NavButton(
            label: 'return_to_main'.toTr(),
            icon: Icons.arrow_back_ios_new_rounded,
            isPrimary: false,
            onTap: onBack,
          ),

          const Spacer(),

          // ── Next Step / Submit ───────────────────────
          _NavButton(
            label:
                isLastStep ? 'submit'.toTr() : nextStepLabel ?? 'next'.toTr(),
            icon: isLastStep
                ? Icons.check_circle_outline_rounded
                : Icons.arrow_forward_ios_rounded,
            isPrimary: true,
            isSubmit: isLastStep,
            onTap: () {
              if (isLastStep) {
                Get.put(AddPatientController()).addPatient();
              } else {
                onNext();
              }
            },
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final bool isSubmit;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
    this.isSubmit = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = isPrimary
        ? (isSubmit ? AppColors.get.green : AppColors.get.primary)
        : AppColors.get.surfaceContainer;

    final Color fg = isPrimary ? Colors.white : AppColors.get.textSecondary;

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        hoverColor: isPrimary
            ? Colors.white.withOpacity(0.1)
            : AppColors.get.primary.withOpacity(0.06),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.toW(),
            vertical: 11.toH(),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isPrimary) ...[
                Icon(icon, size: 16, color: fg),
                SizedBox(width: 8.toW()),
              ],
              CustomText(
                label,
                fontSize: 13,
                fontWeight: FW.semiBold,
                color: fg,
              ),
              if (isPrimary) ...[
                SizedBox(width: 8.toW()),
                Icon(icon, size: 16, color: fg),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
