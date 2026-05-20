import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Features/Dashboard/presentation/widgets/dashboard_action.dart';
import 'package:care_desk/src/Features/Dashboard/presentation/widgets/dashboard_list_stat_cards.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patients_controller.dart';
import 'package:care_desk/src/Shared/Caches/user_cache.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/dialogs/animate_dialogs.dart';

import '../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/appointments_list_widget.dart';
import '../widgets/patients_list_widget.dart';
import '../widgets/doctors_availability_widget.dart';
import '../widgets/dashboard_alerts_widget.dart';
import '../widgets/dashboard_skeleton.dart';
import 'package:get/get.dart';

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
                  title:
                      "${'welcome_back'.toTr()}, ${UserCache.instance.data?.name}",
                  subtitle:
                      'Here\'s_what\'s_happening_at_your_clinic_today'.toTr(),
                  actions: [
                    if (!isSmall) DashboardAction(),
                  ],
                ),
                32.ESH(),

                // Stats Cards - Responsive Wrap
                DashboardListStatCards(constraints: constraints),
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
                      const Expanded(
                        flex: 3,
                        child: DashboardAppointments(),
                      ),
                      24.ESW(),
                      const Expanded(
                        flex: 2,
                        child: DoctorsAvailabilityWidget(),
                      ),
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
                      // 24.ESW(),
                      // Expanded(flex: 1, child: _buildDemographics()),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppointmentsTrend() {
    return DashboardSection(
      title: "weekly_appointments_trend".toTr(),
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
                    const style = TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12);
                    String text;
                    switch (value.toInt()) {
                      case 0:
                        text = 'Mon'.toTr();
                        break;
                      case 1:
                        text = 'Tue'.toTr();
                        break;
                      case 2:
                        text = 'Wed'.toTr();
                        break;
                      case 3:
                        text = 'Thu'.toTr();
                        break;
                      case 4:
                        text = 'Fri'.toTr();
                        break;
                      case 5:
                        text = 'Sat'.toTr();
                        break;
                      case 6:
                        text = 'Sun'.toTr();
                        break;
                      default:
                        text = '';
                    }
                    return SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: Text(text, style: style));
                  },
                ),
              ),
              leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
      title: "revenue_overview".toTr(),
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

  // Widget _buildDemographics() {
  //   return DashboardSection(
  //     title: "demographics",
  //     child: DashboardCard(
  //       height: 300.toH(),
  //       child: PieChart(
  //         PieChartData(
  //           sectionsSpace: 4,
  //           centerSpaceRadius: 40,
  //           sections: [
  //             PieChartSectionData(
  //                 color: AppColors.get.primary,
  //                 value: 45,
  //                 title: '45%',
  //                 radius: 50,
  //                 titleStyle: const TextStyle(
  //                     color: Colors.white, fontWeight: FontWeight.bold)),
  //             PieChartSectionData(
  //                 color: Colors.orange,
  //                 value: 30,
  //                 title: '30%',
  //                 radius: 50,
  //                 titleStyle: const TextStyle(
  //                     color: Colors.white, fontWeight: FontWeight.bold)),
  //             PieChartSectionData(
  //                 color: Colors.amber,
  //                 value: 25,
  //                 title: '25%',
  //                 radius: 50,
  //                 titleStyle: const TextStyle(
  //                     color: Colors.white, fontWeight: FontWeight.bold)),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildQuickActions() {
    return DashboardSection(
      title: "quick_actions",
      child: Column(
        children: [
          _buildActionButton(
            "add_new_patient".toTr(),
            Icons.person_add_outlined,
            Colors.blue,
            onTap: () {
              Get.put(PatientsController());
              context.go('/patients/create');
            },
          ),
          12.ESH(),
          _buildActionButton(
            "create_invoice".toTr(),
            Icons.receipt_long_outlined,
            Colors.green,
            onTap: () => Dialogs.customToast(
                text: 'feature_coming_soon'.toTr(),
                context: context,
                isSuccess: true),
          ),
          12.ESH(),
          _buildActionButton(
            "manage_schedule".toTr(),
            Icons.schedule_outlined,
            Colors.orange,
            onTap: () => context.go('/appointments/calendar'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String title,
    IconData icon,
    Color color, {
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
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
            Icon(Icons.chevron_right,
                size: 18, color: AppColors.get.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return DashboardSection(
      title: "recent_activity",
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
                CustomText("new_appointment_scheduled",
                    fontWeight: FW.semiBold, fontSize: 14),
                4.ESH(),
                CustomText("activity_new_appointment_detail",
                    color: AppColors.get.textSecondary, fontSize: 12),
              ],
            ),
          ),
          CustomText("2m ${"ago".toTr()}",
              color: AppColors.get.textSecondary, fontSize: 12),
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
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
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
