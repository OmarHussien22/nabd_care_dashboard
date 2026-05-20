import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Dashboard/presentation/widgets/stat_card.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Card/card_responsive.dart';
import 'package:flutter/material.dart';

class DashboardListStatCards extends StatelessWidget {
  final BoxConstraints constraints;
  const DashboardListStatCards({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    // Stats Cards - Responsive Wrap
    return Wrap(
      spacing: 12.toW(),
      runSpacing: 12.toH(),
      children: [
        CardResponsive(
          constraints: constraints,
          child: const StatCard(
            title: "total_patients",
            value: "1,248",
            icon: Icons.people_outline,
            color: Colors.blue,
            trend: "+12.5%",
          ),
        ),
        CardResponsive(
          constraints: constraints,
          child: const StatCard(
            title: "appointments_today",
            value: "42",
            icon: Icons.calendar_today_outlined,
            color: Colors.orange,
            trend: "+5%",
          ),
        ),
        CardResponsive(
          constraints: constraints,
          child: const StatCard(
            title: "total_revenue",
            value: "\$12,450",
            icon: Icons.attach_money,
            color: Colors.green,
            trend: "+18.2%",
          ),
        ),
        CardResponsive(
          constraints: constraints,
          child: const StatCard(
            title: "active_doctors",
            value: "18",
            icon: Icons.medical_services_outlined,
            color: Colors.purple,
            trend: "0%",
          ),
        ),
      ],
    );
  }
}
