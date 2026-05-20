import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'dashboard_card.dart';

class DoctorsAvailabilityWidget extends StatelessWidget {
  const DoctorsAvailabilityWidget({super.key});

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
                CustomText("doctors_availability", fontSize: 16, fontWeight: FW.bold),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                      ),
                      8.ESW(),
                      const CustomText("online_count", fontSize: 11, color: Colors.green, fontWeight: FW.bold),
                    ],
                  ),
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
              return _buildDoctorItem(index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorItem(int index) {
    final names = ["Dr. Sarah Jones", "Dr. Mike Ross", "Dr. Emily Blunt", "Dr. David Smith"];
    final specialties = ["cardiologist", "neurologist", "pediatrician", "general_surgeon"];
    final statuses = ["available", "busy", "available", "on_break"];
    final statusColors = [Colors.green, Colors.red, Colors.green, Colors.orange];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.get.primary.withOpacity(0.1),
                child: CustomText(names[index].split(' ')[1][0], fontWeight: FW.bold, color: AppColors.get.primary),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: statusColors[index],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          16.ESW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(names[index], fontWeight: FW.bold, fontSize: 14),
                4.ESH(),
                CustomText(specialties[index], color: AppColors.get.textSecondary, fontSize: 12),
              ],
            ),
          ),
          CustomText(
            statuses[index],
            fontSize: 12,
            color: statusColors[index],
            fontWeight: FW.semiBold,
          ),
        ],
      ),
    );
  }
}
