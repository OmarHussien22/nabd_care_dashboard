import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class StepperAddPatient extends StatelessWidget {
  /// List of (icon, label) for each step.
  final List<(IconData, String)> steps;
  final int currentStep;

  /// Optional tap handler (only triggers for completed/current steps).
  final ValueChanged<int>? onStepTapped;

  const StepperAddPatient({
    super.key,
    required this.steps,
    required this.currentStep,
    this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          GestureDetector(
            onTap: onStepTapped != null && i <= currentStep
                ? () => onStepTapped!(i)
                : null,
            child: _StepDot(
              icon: steps[i].$1,
              label: steps[i].$2,
              index: i,
              isActive: i == currentStep,
              isCompleted: i < currentStep,
            ),
          ),
          if (i < steps.length - 1)
            Builder(builder: (context) {
              final screenWidth = MediaQuery.of(context).size.width;
              double lineWidth = 180;
              if (screenWidth >= 1024) {
                lineWidth = 200;
              } else if (screenWidth >= 600) {
                lineWidth = 300;
              } else {
                lineWidth = 100;
              }
              return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: lineWidth.toW(),
                height: 2,
                margin: EdgeInsets.symmetric(horizontal: 4.toW()),
                decoration: BoxDecoration(
                  color: i < currentStep
                      ? AppColors.get.primary
                      : AppColors.get.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
        ],
      ],
    );
  }
}

class _StepDot extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final bool isActive;
  final bool isCompleted;

  const _StepDot({
    required this.icon,
    required this.label,
    required this.index,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double dotWidth = 42;
    double dotHeight = 46;
    double iconSize = 20;

    if (screenWidth >= 1024) {
      dotWidth = 52;
      dotHeight = 56;
      iconSize = 24;
    } else if (screenWidth >= 600) {
      dotWidth = 48;
      dotHeight = 52;
      iconSize = 22;
    }

    final Color bkgColor = isCompleted
        ? AppColors.get.primary
        : isActive
            ? AppColors.get.primary.withOpacity(0.12)
            : AppColors.get.surfaceContainer;

    final Color iconColor = isCompleted
        ? AppColors.get.white
        : isActive
            ? AppColors.get.primary
            : AppColors.get.textSecondary;

    final Color borderColor = isCompleted
        ? AppColors.get.primary
        : isActive
            ? AppColors.get.primary
            : AppColors.get.border;

    final Color labelColor = isCompleted || isActive
        ? AppColors.get.primary
        : AppColors.get.textSecondary;

    double labelWidth = 82;
    if (screenWidth >= 1024) {
      labelWidth = 100;
    } else if (screenWidth >= 600) {
      labelWidth = 90;
    } else {
      labelWidth = 70; // Fixed size on mobile to avoid extreme shrinking
    }

    return Tooltip(
      message: label,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: dotWidth.toW(),
            height: dotHeight.toH(),
            decoration: BoxDecoration(
              color: bkgColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: AppColors.get.primary.withOpacity(0.25),
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      )
                    ]
                  : isCompleted
                      ? [
                          BoxShadow(
                            color: AppColors.get.primary.withOpacity(0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : null,
            ),
            child: Center(
              child: Icon(
                isCompleted ? Icons.check_rounded : icon,
                size: iconSize,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(height: 10.toH()),
          SizedBox(
            width: labelWidth.toW(),
            child: CustomText(
              label,
              fontSize: 10,
              fontWeight: isActive ? FW.semiBold : FW.regular,
              color: labelColor,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
