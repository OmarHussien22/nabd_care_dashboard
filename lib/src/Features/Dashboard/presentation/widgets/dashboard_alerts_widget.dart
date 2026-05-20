import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'dashboard_card.dart';
import 'dashboard_section.dart';

class DashboardAlertsWidget extends StatelessWidget {
  const DashboardAlertsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardSection(
      title: "system_alerts",
      child: Column(
        children: [
          _buildAlert(
            "missed_appointments",
            "missed_appointments_desc",
            Icons.warning_amber_rounded,
            Colors.red,
          ),
          12.ESH(),
          _buildAlert(
            "pending_invoices_temp", // We use pending_invoices_temp to avoid conflict with existing pending_invoices key if any, or just use pending_invoices
            "pending_invoices_desc",
            Icons.account_balance_wallet_outlined,
            Colors.orange,
          ),
          12.ESH(),
          _buildAlert(
            "inventory_low",
            "inventory_low_desc",
            Icons.inventory_2_outlined,
            Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildAlert(String title, String message, IconData icon, Color color) {
    return DashboardCard(
      padding: const EdgeInsets.all(16),
      color: color.withOpacity(0.03),
      border: Border.all(color: color.withOpacity(0.2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          16.ESW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title, fontWeight: FW.bold, fontSize: 14, color: color),
                4.ESH(),
                CustomText(message, color: AppColors.get.textSecondary, fontSize: 12, textHeight: 1.4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

