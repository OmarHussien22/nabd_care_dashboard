import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';

class StepperAddPatient extends StatelessWidget {
  final List<(IconData, String)> steps;
  final int currentStep;
  const StepperAddPatient({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          _StepDot(
            icon: steps[i].$1,
            index: i,
            isActive: i == currentStep,
            isCompleted: i < currentStep,
          ),
          if (i < steps.length - 1)
            Container(
              width: 60.toW(),
              height: 2,
              margin: EdgeInsets.symmetric(horizontal: 4.toW()),
              decoration: BoxDecoration(
                color: i < currentStep
                    ? AppColors.get.primary
                    : AppColors.get.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ],
    );
  }
}

class _StepDot extends StatelessWidget {
  final IconData icon;
  final int index;
  final bool isActive;
  final bool isCompleted;

  const _StepDot({
    required this.icon,
    required this.index,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    Color bkgColor = isCompleted
        ? AppColors.get.primary
        : isActive
            ? AppColors.get.primary.withOpacity(0.12)
            : AppColors.get.surfaceContainer;

    Color iconColor = isCompleted
        ? AppColors.get.white
        : isActive
            ? AppColors.get.primary
            : AppColors.get.textSecondary;

    Color borderColor = isCompleted
        ? AppColors.get.primary
        : isActive
            ? AppColors.get.primary
            : AppColors.get.border;

    return Tooltip(
      message: 'Step ${index + 1}',
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: bkgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: isActive ? 2 : 1,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: AppColors.get.primary.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Icon(
          isCompleted ? Icons.check_rounded : icon,
          size: isCompleted ? 20 : 18,
          color: iconColor,
        ),
      ),
    );
  }
}
