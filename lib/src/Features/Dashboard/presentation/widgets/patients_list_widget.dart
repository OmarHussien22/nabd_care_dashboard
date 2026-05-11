import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'dashboard_card.dart';
import 'view_all_button.dart';

class DashboardRecentPatients extends StatelessWidget {
  const DashboardRecentPatients({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText("Recent Patients", fontSize: 16, fontWeight: FW.bold),
                ViewAllButton(
                  label: "See All",
                  onTap: () => NavigationService.instance.push('/patients'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              return _buildPatientItem(index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPatientItem(int index) {
    final names = ["John Smith", "Sarah Jane", "Michael Ross", "Emma Wilson"];
    final id = ["#PT-8234", "#PT-8235", "#PT-8236", "#PT-8237"];
    final dates = ["10 May, 2024", "08 May, 2024", "05 May, 2024", "02 May, 2024"];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.get.primary.withOpacity(0.1),
            child: CustomText(names[index][0], fontWeight: FW.bold, color: AppColors.get.primary),
          ),
          16.ESW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(names[index], fontWeight: FW.bold, fontSize: 14),
                4.ESH(),
                CustomText(id[index], color: AppColors.get.textSecondary, fontSize: 12),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(dates[index], fontWeight: FW.medium, fontSize: 13),
              4.ESH(),
              CustomText("Last Visit", color: AppColors.get.textSecondary, fontSize: 11),
            ],
          ),
        ],
      ),
    );
  }
}
