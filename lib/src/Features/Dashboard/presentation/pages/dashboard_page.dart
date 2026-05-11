import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/stat_card.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/appointments_list_widget.dart';
import '../widgets/patients_list_widget.dart';
import '../widgets/doctors_availability_widget.dart';
import '../widgets/dashboard_alerts_widget.dart';
import '../widgets/dashboard_skeleton.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading for the premium feel
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const DashboardSkeleton();

    return AnimatedWrapper(
      styles: WrapAnimationStyles.slide,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 900;
          final isMedium = constraints.maxWidth < 1200;

          return SingleChildScrollView(
            padding: EdgeInsets.all(isSmall ? 16.0 : 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashboardHeader(
                  title: "Welcome Back, Omar!",
                  subtitle: "Here's what's happening at your clinic today.",
                  actions: [
                    if (!isSmall) _buildActionButtons(),
                  ],
                ),
                32.ESH(),

                // Stats Cards - Responsive Wrap
                Wrap(
                  spacing: 20.toW(),
                  runSpacing: 20.toH(),
                  children: [
                    _buildResponsiveStat(
                      constraints: constraints,
                      child: const StatCard(
                        title: "Total Patients",
                        value: "1,248",
                        icon: Icons.people_outline,
                        color: Colors.blue,
                        trend: "+12.5%",
                      ),
                    ),
                    _buildResponsiveStat(
                      constraints: constraints,
                      child: const StatCard(
                        title: "Appointments Today",
                        value: "42",
                        icon: Icons.calendar_today_outlined,
                        color: Colors.orange,
                        trend: "+5%",
                      ),
                    ),
                    _buildResponsiveStat(
                      constraints: constraints,
                      child: const StatCard(
                        title: "Total Revenue",
                          value: "\$12,450",
                        icon: Icons.attach_money,
                        color: Colors.green,
                        trend: "+18.2%",
                      ),
                    ),
                    _buildResponsiveStat(
                      constraints: constraints,
                      child: const StatCard(
                        title: "Active Doctors",
                        value: "18",
                        icon: Icons.medical_services_outlined,
                        color: Colors.purple,
                        trend: "0%",
                      ),
                    ),
                  ],
                ),

                40.ESH(),

                // Main Charts Row
                if (isSmall) ...[
                  _buildAppointmentsTrend(),
                  24.ESH(),
                  _buildRevenueChart(),
                ] else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: _buildAppointmentsTrend()),
                      24.ESW(),
                      Expanded(flex: 1, child: _buildRevenueChart()),
                    ],
                  ),

                40.ESH(),

                // Appointments & Availability Row
                if (isMedium) ...[
                  const DashboardAppointments(),
                  24.ESH(),
                  const DoctorsAvailabilityWidget(),
                ] else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 3, child: DashboardAppointments()),
                      24.ESW(),
                      const Expanded(flex: 2, child: DoctorsAvailabilityWidget()),
                    ],
                  ),

                40.ESH(),

                // Patients & Alerts Row
                if (isMedium) ...[
                  const DashboardRecentPatients(),
                  24.ESH(),
                  const DashboardAlertsWidget(),
                ] else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 2, child: DashboardRecentPatients()),
                      24.ESW(),
                      const Expanded(flex: 1, child: DashboardAlertsWidget()),
                    ],
                  ),

                40.ESH(),

                // Bottom Row: Activity & Actions
                if (isSmall) ...[
                  _buildQuickActions(),
                  24.ESH(),
                  _buildRecentActivity(),
                ] else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildQuickActions()),
                      24.ESW(),
                      Expanded(flex: 2, child: _buildRecentActivity()),
                      24.ESW(),
                      Expanded(flex: 1, child: _buildDemographics()),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildResponsiveStat({required BoxConstraints constraints, required Widget child}) {
    double width;
    if (constraints.maxWidth < 600) {
      width = constraints.maxWidth;
    } else if (constraints.maxWidth < 1100) {
      width = (constraints.maxWidth - 20) / 2;
    } else {
      width = (constraints.maxWidth - 60) / 4;
    }
    return SizedBox(width: width, child: child);
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.download_outlined, size: 18),
          label: const Text("Export Report"),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.toRad())),
          ),
        ),
        16.ESW(),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 18),
          label: const Text("New Appointment"),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.get.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.toRad())),
            elevation: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentsTrend() {
    return DashboardSection(
      title: "Weekly Appointments Trend",
      child: DashboardCard(
        height: 350.toH(),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    const style = TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12);
                    String text;
                    switch (value.toInt()) {
                      case 0: text = 'Mon'; break;
                      case 1: text = 'Tue'; break;
                      case 2: text = 'Wed'; break;
                      case 3: text = 'Thu'; break;
                      case 4: text = 'Fri'; break;
                      case 5: text = 'Sat'; break;
                      case 6: text = 'Sun'; break;
                      default: text = '';
                    }
                    return SideTitleWidget(axisSide: meta.axisSide, child: Text(text, style: style));
                  },
                ),
              ),
              leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: [
              _makeBarGroup(0, 5, AppColors.get.primary.withOpacity(0.4)),
              _makeBarGroup(1, 12, AppColors.get.primary.withOpacity(0.4)),
              _makeBarGroup(2, 18, AppColors.get.primary),
              _makeBarGroup(3, 15, AppColors.get.primary.withOpacity(0.4)),
              _makeBarGroup(4, 10, AppColors.get.primary.withOpacity(0.4)),
              _makeBarGroup(5, 8, AppColors.get.primary.withOpacity(0.4)),
              _makeBarGroup(6, 4, AppColors.get.primary.withOpacity(0.4)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRevenueChart() {
    return DashboardSection(
      title: "Revenue Overview",
      child: DashboardCard(
        height: 350.toH(),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 3),
                  FlSpot(2.6, 2),
                  FlSpot(4.9, 5),
                  FlSpot(6.8, 3.1),
                  FlSpot(8, 4),
                  FlSpot(9.5, 3),
                  FlSpot(11, 4),
                ],
                isCurved: true,
                color: AppColors.get.primary,
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: AppColors.get.primary.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDemographics() {
    return DashboardSection(
      title: "Demographics",
      child: DashboardCard(
        height: 300.toH(),
        child: PieChart(
          PieChartData(
            sectionsSpace: 4,
            centerSpaceRadius: 40,
            sections: [
              PieChartSectionData(color: AppColors.get.primary, value: 45, title: '45%', radius: 50, titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              PieChartSectionData(color: Colors.orange, value: 30, title: '30%', radius: 50, titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              PieChartSectionData(color: Colors.amber, value: 25, title: '25%', radius: 50, titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return DashboardSection(
      title: "Quick Actions",
      child: Column(
        children: [
          _buildActionButton("Add New Patient", Icons.person_add_outlined, Colors.blue),
          12.ESH(),
          _buildActionButton("Create Invoice", Icons.receipt_long_outlined, Colors.green),
          12.ESH(),
          _buildActionButton("Manage Schedule", Icons.schedule_outlined, Colors.orange),
        ],
      ),
    );
  }

  Widget _buildActionButton(String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12.toRad()),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12.toRad()),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.toRad()),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            16.ESW(),
            CustomText(title, fontWeight: FW.medium, fontSize: 14),
            const Spacer(),
            Icon(Icons.chevron_right, size: 18, color: AppColors.get.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return DashboardSection(
      title: "Recent Activity",
      child: DashboardCard(
        child: Column(
          children: List.generate(4, (index) => _buildActivityItem(index)),
        ),
      ),
    );
  }

  Widget _buildActivityItem(int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: index == 3 ? 0 : 20.toH()),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.get.primary.withOpacity(0.1),
            child: Icon(Icons.check, size: 16, color: AppColors.get.primary),
          ),
          16.ESW(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText("New appointment scheduled", fontWeight: FW.semiBold, fontSize: 14),
                4.ESH(),
                CustomText("Dr. Sarah with Patient Ahmed Ali", color: AppColors.get.textSecondary, fontSize: 12),
              ],
            ),
          ),
          CustomText("2m ago", color: AppColors.get.textSecondary, fontSize: 12),
        ],
      ),
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 20.toW(),
          borderRadius: BorderRadius.circular(4.toRad()),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: AppColors.get.background,
          ),
        ),
      ],
    );
  }
}
