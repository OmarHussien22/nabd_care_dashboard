import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'dashboard_card.dart';
import 'view_all_button.dart';

class DashboardAppointments extends StatelessWidget {
  const DashboardAppointments({super.key});

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
                CustomText("todays_appointments",
                    fontSize: 16, fontWeight: FW.bold),
                ViewAllButton(
                  label: "view_all",
                  onTap: () => NavigationService.instance.push('/appointments'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              return _buildAppointmentItem(index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentItem(int index) {
    final times = ["09:00 AM", "10:30 AM", "11:45 AM", "02:00 PM", "03:30 PM"];
    final patients = [
      "Ahmed Ali",
      "Sara Hassan",
      "John Doe",
      "Maria Garcia",
      "Robert Brown"
    ];
    final doctors = [
      "Dr. Sarah Jones",
      "Dr. Mike Ross",
      "Dr. Sarah Jones",
      "Dr. Emily Blunt",
      "Dr. Mike Ross"
    ];
    final statuses = [
      "confirmed",
      "pending",
      "confirmed",
      "waiting",
      "confirmed"
    ];
    final statusColors = [
      Colors.green,
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.green
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 80.toW(),
            child:
                CustomText(times[index], fontWeight: FW.semiBold, fontSize: 13),
          ),
          20.ESW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(patients[index], fontWeight: FW.bold, fontSize: 14),
                4.ESH(),
                CustomText(doctors[index],
                    color: AppColors.get.textSecondary, fontSize: 12),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColors[index].withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: CustomText(
              statuses[index],
              fontSize: 11,
              color: statusColors[index],
              fontWeight: FW.bold,
            ),
          ),
          20.ESW(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 18),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
