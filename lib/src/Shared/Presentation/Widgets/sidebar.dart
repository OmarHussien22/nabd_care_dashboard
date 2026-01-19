import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final bool isCollapsed;
  final Function(bool) onToggle;
  final int selectedIndex;
  final Function(int) onItemSelected;

  const Sidebar({
    super.key,
    this.isCollapsed = false,
    required this.onToggle,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isCollapsed ? 70 : 260,
      decoration: BoxDecoration(
        color: AppPalette.surface,
        border: const Border(right: BorderSide(color: AppPalette.border)),
      ),
      child: Column(
        children: [
          // Header / Logo
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: isCollapsed ? Alignment.center : Alignment.centerLeft,
            child: Container(
              height: 64,
              padding: EdgeInsets.symmetric(horizontal: isCollapsed ? 12 : 24),
              alignment: isCollapsed ? Alignment.center : Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: isCollapsed
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  const Icon(Icons.local_hospital_rounded,
                      color: AppPalette.primary, size: 28),
                  if (!isCollapsed) ...[
                    const SizedBox(width: 12),
                    const CustomText(
                      "CareDesk",
                      fontWeight: FW.bold,
                      fontSize: 20,
                      color: AppPalette.textPrimary,
                    ),
                  ]
                ],
              ),
            ),
          ),
          const Divider(height: 1),

          // Navigation
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              children: [
                _buildNavItem(0, Icons.dashboard_rounded, "Dashboard"),
                _buildNavItem(1, Icons.calendar_month_rounded, "Appointments"),
                _buildNavItem(2, Icons.people_alt_rounded, "Patients"),
                // _buildNavItem(3, Icons.medical_services_rounded, "Treatments"),
                // _buildNavItem(4, Icons.payments_rounded, "Billing"),
                const SizedBox(height: 24),
                if (!isCollapsed)
                  const Padding(
                    padding: EdgeInsets.only(left: 12, bottom: 8),
                    child: CustomText(
                      "SETTINGS",
                      fontSize: 11,
                      fontWeight: FW.bold,
                      color: AppPalette.textSecondary,
                    ),
                  ),
                _buildNavItem(5, Icons.settings_rounded, "Settings"),
              ],
            ),
          ),

          // Collapse Button
          Divider(color: AppPalette.border, height: 1),
          IconButton(
            onPressed: () => onToggle(!isCollapsed),
            icon: Icon(
                isCollapsed
                    ? Icons.keyboard_double_arrow_right_rounded
                    : Icons.keyboard_double_arrow_left_rounded,
                color: AppPalette.textSecondary),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = index == selectedIndex;
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Tooltip(
        message: isCollapsed ? label : "",
        child: InkWell(
          onTap: () => onItemSelected(index),
          borderRadius: BorderRadius.circular(8),
          hoverColor: AppPalette.primary.withOpacity(0.05),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppPalette.primary.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected
                    ? AppPalette.primary.withOpacity(0.1)
                    : Colors.transparent,
              ),
            ),
            child: isCollapsed
                ? Icon(
                    icon,
                    size: 18,
                    color: isSelected
                        ? AppPalette.primary
                        : AppPalette.textSecondary,
                  )
                : Row(
                    mainAxisAlignment: isCollapsed
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        size: 22,
                        color: isSelected
                            ? AppPalette.primary
                            : AppPalette.textSecondary,
                      ),
                      if (!isCollapsed) ...[
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomText(
                            label,
                            color: isSelected
                                ? AppPalette.primary
                                : AppPalette.textPrimary,
                            fontWeight: isSelected ? FW.semiBold : FW.medium,
                            fontSize: 14,
                            isOverFlow: true,
                          ),
                        ),
                      ]
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
