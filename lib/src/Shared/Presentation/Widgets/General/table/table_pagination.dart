import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class TablePagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int)? onPageChanged;

  const TablePagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.get.white,
        border: Border(
          top: BorderSide(color: AppColors.get.border.withValues(alpha: 0.5)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.get.surfaceContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomText(
                  "Showing page $currentPage of $totalPages",
                  color: AppColors.get.textSecondary,
                  fontSize: 12,
                  fontWeight: FW.medium,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _buildNavButton(
                icon: Icons.keyboard_arrow_left_rounded,
                enabled: currentPage > 1,
                onTap: () => onPageChanged?.call(currentPage - 1),
              ),
              const SizedBox(width: 8),
              _buildNavButton(
                icon: Icons.keyboard_arrow_right_rounded,
                enabled: currentPage < totalPages,
                onTap: () => onPageChanged?.call(currentPage + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({required IconData icon, required bool enabled, required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: enabled 
                ? AppColors.get.border 
                : AppColors.get.border.withValues(alpha: 0.3)
            ),
            borderRadius: BorderRadius.circular(10),
            color: enabled ? Colors.white : Colors.grey.shade50,
          ),
          child: Icon(
            icon,
            color: enabled ? AppColors.get.primary : Colors.grey.shade300,
            size: 20,
          ),
        ),
      ),
    );
  }
}
