import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/widgets/side_bar_item.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Spaces&Dividers/custom_divider.dart';
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
      duration: const Duration(milliseconds: 250),
      width: isCollapsed ? 77.toW() : 240.toW(),
      decoration: BoxDecoration(
        color: AppColors.get.surface,
        border: Border(
          right: BorderSide(color: AppColors.get.border),
        ),
      ),
      child: Column(
        children: [
          // Header / Logo
          // 10.ESW(),
          Container(
            height: 80.toH(),
            alignment: isCollapsed ? Alignment.center : Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: isCollapsed
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                isCollapsed ? 14.ESW() : 18.ESW(),
                Icon(
                  Icons.local_hospital_rounded,
                  color: AppColors.get.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: isCollapsed ? 0 : 1,
                    child: isCollapsed
                        ? const SizedBox.shrink()
                        : CustomText(
                            "CareDesk",
                            fontWeight: FW.semiBold,
                            fontSize: 16,
                            color: AppColors.get.textPrimary,
                          ),
                  ),
                ),
              ],
            ),
          ),
          XDivider.normal(height: 1),

          // Navigation
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              children: [
                SideBarItem(
                  index: 0,
                  icon: Icons.dashboard_rounded,
                  label: "Dashboard",
                  selectedIndex: selectedIndex,
                  onItemSelected: onItemSelected,
                  isCollapsed: isCollapsed,
                ),
                SideBarItem(
                  index: 1,
                  icon: Icons.calendar_month_rounded,
                  label: "Appointments",
                  selectedIndex: selectedIndex,
                  onItemSelected: onItemSelected,
                  isCollapsed: isCollapsed,
                ),
                SideBarItem(
                  index: 2,
                  icon: Icons.people_alt_rounded,
                  label: "Patients",
                  selectedIndex: selectedIndex,
                  onItemSelected: onItemSelected,
                  isCollapsed: isCollapsed,
                ),
                // _buildNavItem(3, Icons.medical_services_rounded, "Treatments"),
                // _buildNavItem(4, Icons.payments_rounded, "Billing"),
                // const SizedBox(height: 24),
                // if (!isCollapsed)
                //   Padding(
                //     padding: EdgeInsets.only(left: 12, bottom: 8),
                //     child: CustomText(
                //       "SETTINGS",
                //       fontSize: 11,
                //       fontWeight: FW.bold,
                //       color: AppColors.get.textSecondary,
                //     ),
                //   ),
                SideBarItem(
                  index: 5,
                  icon: Icons.settings_rounded,
                  label: "Settings",
                  selectedIndex: selectedIndex,
                  onItemSelected: onItemSelected,
                  isCollapsed: isCollapsed,
                ),
              ],
            ),
          ),

          // Collapse Button
          // Divider(color: AppColors.get.border, height: 1),
          // IconButton(
          //   onPressed: () => onToggle(!isCollapsed),
          //   icon: Icon(
          //       isCollapsed
          //           ? Icons.keyboard_double_arrow_right_rounded
          //           : Icons.keyboard_double_arrow_left_rounded,
          //       color: AppColors.get.textSecondary),
          // ),
          // const SizedBox(height: 8),
        ],
      ),
    );
  }
}
