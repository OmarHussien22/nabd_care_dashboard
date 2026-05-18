import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
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
                  title:
                      "${'welcome_back'.toTr()}, ${UserCache.instance.data?.name}",
                  subtitle:
                      'Here\'s_what\'s_happening_at_your_clinic_today'.toTr(),
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
                        title: "total_patients",
                        value: "1,248",
                        icon: Icons.people_outline,
                        color: Colors.blue,
                        trend: "+12.5%",
                      ),
                    ),
                    _buildResponsiveStat(
                      constraints: constraints,
                      child: const StatCard(
                        title: "appointments_today",
                        value: "42",
                        icon: Icons.calendar_today_outlined,
                        color: Colors.orange,
                        trend: "+5%",
                      ),
                    ),
                    _buildResponsiveStat(
                      constraints: constraints,
                      child: const StatCard(
                        title: "total_revenue",
                        value: "\$12,450",
                        icon: Icons.attach_money,
                        color: Colors.green,
                        trend: "+18.2%",
                      ),
                    ),
                    _buildResponsiveStat(
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
                      const Expanded(
                          flex: 2, child: DoctorsAvailabilityWidget()),
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

  Widget _buildResponsiveStat(
      {required BoxConstraints constraints, required Widget child}) {
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
          onPressed: () {
            Dialogs.animatedDialog(
              context: context,
              child: const _ExportReportDialog(),
            );
          },
          icon: const Icon(Icons.download_outlined, size: 18),
          label: CustomText("export_report".toTr()),
          style: OutlinedButton.styleFrom(
            padding:
                EdgeInsets.symmetric(horizontal: 16.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.toRad())),
          ),
        ),
        16.ESW(),
        ElevatedButton.icon(
          onPressed: () {
            context.go('/appointments/create');
          },
          icon: const Icon(Icons.add, size: 18),
          label: CustomText("new_appointment".toTr()),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.get.primary,
            foregroundColor: Colors.white,
            padding:
                EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.toRad())),
            elevation: 0,
          ),
        ),
      ],
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
              PieChartSectionData(
                  color: AppColors.get.primary,
                  value: 45,
                  title: '45%',
                  radius: 50,
                  titleStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              PieChartSectionData(
                  color: Colors.orange,
                  value: 30,
                  title: '30%',
                  radius: 50,
                  titleStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              PieChartSectionData(
                  color: Colors.amber,
                  value: 25,
                  title: '25%',
                  radius: 50,
                  titleStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return DashboardSection(
      title: "quick_actions".toTr(),
      child: Column(
        children: [
          _buildActionButton(
              "add_new_patient".toTr(), Icons.person_add_outlined, Colors.blue),
          12.ESH(),
          _buildActionButton("create_invoice".toTr(),
              Icons.receipt_long_outlined, Colors.green),
          12.ESH(),
          _buildActionButton(
              "manage_schedule".toTr(), Icons.schedule_outlined, Colors.orange),
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
                CustomText("new_appointment_scheduled".toTr(),
                    fontWeight: FW.semiBold, fontSize: 14),
                4.ESH(),
                CustomText("Dr. Sarah with Patient Ahmed Ali",
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

class _ExportReportDialog extends StatefulWidget {
  const _ExportReportDialog();

  @override
  State<_ExportReportDialog> createState() => _ExportReportDialogState();
}

class _ExportReportDialogState extends State<_ExportReportDialog> {
  bool _isExporting = false;
  String _selectedFormat = '';
  double _progress = 0.0;

  void _startExport(String format) async {
    setState(() {
      _isExporting = true;
      _selectedFormat = format;
      _progress = 0.0;
    });

    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 180));
      if (!mounted) return;
      setState(() {
        _progress = i * 0.1;
      });
    }

    if (mounted) {
      Navigator.pop(context); // Close dialog
      Dialogs.customToast(
        text: 'clinic_report_exported_successfully_as'.toTr() + _selectedFormat,
        context: context,
        isSuccess: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.toRad())),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(28.toRad()),
        width: 380.toW(),
        child: _isExporting ? _buildExportingView() : _buildSelectionView(),
      ),
    );
  }

  Widget _buildSelectionView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.toRad()),
              decoration: BoxDecoration(
                color: AppColors.get.primary.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.download_outlined,
                  color: AppColors.get.primary, size: 24),
            ),
            16.ESW(),
            const CustomText(
              'export_report',
              fontSize: 18,
              fontWeight: FW.bold,
            ),
          ],
        ),
        20.ESH(),
        CustomText(
          'select_your_preferred_document_format_to_download_the_comprehensive_clinic_performance_report',
          fontSize: 13,
          color: AppColors.get.textSecondary,
        ),
        24.ESH(),
        _buildFormatOption(
          title: 'PDF Document (.pdf)',
          subtitle: 'perfect_for_printing_and_sharing_official_reports',
          icon: Icons.picture_as_pdf_outlined,
          color: Colors.red,
          onTap: () => _startExport('PDF'),
        ),
        12.ESH(),
        _buildFormatOption(
          title: 'Excel Spreadsheet (.xlsx)',
          subtitle: 'ideal_for_detailed_custom_data_analysis',
          icon: Icons.table_view_outlined,
          color: Colors.green,
          onTap: () => _startExport('Excel'),
        ),
        12.ESH(),
        _buildFormatOption(
          title: 'CSV File (.csv)',
          subtitle: 'lightweight_format_for_database_imports',
          icon: Icons.insert_drive_file_outlined,
          color: Colors.blueGrey,
          onTap: () => _startExport('CSV'),
        ),
        24.ESH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: CustomText(
                'cancel',
                color: AppColors.get.textSecondary,
                fontWeight: FW.medium,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExportingView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        20.ESH(),
        SizedBox(
          width: 70.toW(),
          height: 70.toH(),
          child: CircularProgressIndicator(
            value: _progress,
            strokeWidth: 5,
            backgroundColor: AppColors.get.border.withOpacity(0.5),
            color: AppColors.get.primary,
          ),
        ),
        24.ESH(),
        CustomText(
          '${'generating'.toTr()} $_selectedFormat ${'report'.toTr()}...',
          fontSize: 16,
          fontWeight: FW.bold,
        ),
        10.ESH(),
        CustomText(
          '${(_progress * 100).toInt()}% ${'completed'.toTr()}',
          fontSize: 14,
          color: AppColors.get.textSecondary,
          fontWeight: FW.medium,
        ),
        16.ESH(),
        CustomText(
          'Please do not close this window.',
          fontSize: 12,
          color: AppColors.get.textDisabled,
        ),
        10.ESH(),
      ],
    );
  }

  Widget _buildFormatOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.toRad()),
      child: Container(
        padding: EdgeInsets.all(12.toRad()),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12.toRad()),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.toRad()),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.toRad()),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            16.ESW(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title, fontWeight: FW.semiBold, fontSize: 14),
                  4.ESH(),
                  CustomText(subtitle,
                      fontSize: 11, color: AppColors.get.textSecondary),
                ],
              ),
            ),
            Icon(Icons.chevron_right,
                size: 16, color: AppColors.get.textSecondary),
          ],
        ),
      ),
    );
  }
}
