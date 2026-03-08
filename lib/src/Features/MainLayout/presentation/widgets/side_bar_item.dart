import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class SideBarItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final int selectedIndex;
  final Function(int) onItemSelected;
  final bool isCollapsed;
  const SideBarItem(
      {super.key,
      required this.index,
      required this.icon,
      required this.label,
      required this.selectedIndex,
      required this.onItemSelected,
      required this.isCollapsed});

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == selectedIndex;
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Tooltip(
        message: isCollapsed ? label : "",
        child: InkWell(
          onTap: () => onItemSelected(index),
          borderRadius: BorderRadius.circular(10),
          hoverColor: AppColors.get.primary.withAlpha(5),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.get.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? AppColors.get.primary.withValues(alpha: .2)
                    : Colors.transparent,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Show only icon when width is too small (during animation or collapsed)
                final bool showOnlyIcon = constraints.maxWidth < 80;

                if (showOnlyIcon) {
                  return Icon(
                    icon,
                    size: 18,
                    color: isSelected
                        ? AppColors.get.primary
                        : AppColors.get.textSecondary,
                  );
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      size: 22,
                      color: isSelected
                          ? AppColors.get.white
                          : AppColors.get.textSecondary,
                    ),
                    if (!showOnlyIcon) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomText(
                          label,
                          color: isSelected
                              ? AppColors.get.white
                              : AppColors.get.textPrimary,
                          fontWeight: isSelected ? FW.semiBold : FW.medium,
                          fontSize: 14,
                          isOverFlow: true,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
