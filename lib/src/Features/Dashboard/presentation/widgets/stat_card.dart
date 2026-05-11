import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'dashboard_card.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String trend;
  final bool isPositive;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.trend,
    this.isPositive = true,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14.toRad()),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.toW(), vertical: 4.toH()),
                decoration: BoxDecoration(
                  color: (isPositive ? Colors.green : Colors.red).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.toRad()),
                ),
                child: CustomText(
                  trend,
                  fontSize: 11,
                  color: isPositive ? Colors.green : Colors.red,
                  fontWeight: FW.bold,
                ),
              ),
            ],
          ),
          24.ESH(),
          CustomText(
            value,
            fontSize: 28,
            fontWeight: FW.bold,
            color: AppColors.get.textPrimary,
          ),
          4.ESH(),
          CustomText(
            title,
            color: AppColors.get.textSecondary,
            fontSize: 13,
            fontWeight: FW.medium,
          ),
        ],
      ),
    );
  }
}
