import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText("Dashboard Statistics", fontSize: 24, fontWeight: FW.bold, color: AppPalette.textPrimary),
          const SizedBox(height: 8),
          const CustomText("Overview of clinic performance", color: AppPalette.textSecondary),
          const SizedBox(height: 32),
          
          // Stats Cards Row
          Row(
            children: [
              _buildStatCard(title: "Total Patients", value: "1,248", icon: Icons.people_outline, color: Colors.blue),
              const SizedBox(width: 16),
              _buildStatCard(title: "Appointments Today", value: "42", icon: Icons.calendar_today_outlined, color: Colors.orange),
              const SizedBox(width: 16),
              _buildStatCard(title: "Revenue (Month)", value: "\$12,450", icon: Icons.attach_money, color: Colors.green),
            ],
          ),
          
          const SizedBox(height: 32),

          // Charts Row
          Expanded(
            child: Row(
              children: [
                // Booking Days Chart (Bar Chart)
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppPalette.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText("Weekly Bookings", fontSize: 16, fontWeight: FW.semiBold),
                        const SizedBox(height: 24),
                        Expanded(
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              maxY: 20,
                              barTouchData: BarTouchData(enabled: false),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (double value, TitleMeta meta) {
                                      const style = TextStyle(color: AppPalette.textSecondary, fontWeight: FontWeight.bold, fontSize: 12);
                                      Widget text;
                                      switch (value.toInt()) {
                                        case 0: text = const Text('Mon', style: style); break;
                                        case 1: text = const Text('Tue', style: style); break;
                                        case 2: text = const Text('Wed', style: style); break;
                                        case 3: text = const Text('Thu', style: style); break;
                                        case 4: text = const Text('Fri', style: style); break;
                                        case 5: text = const Text('Sat', style: style); break;
                                        case 6: text = const Text('Sun', style: style); break;
                                        default: text = const Text('', style: style);
                                      }
                                      return SideTitleWidget(axisSide: meta.axisSide, child: text);
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              ),
                              gridData: FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                              barGroups: [
                                _makeBarGroup(0, 5, AppPalette.primary),
                                _makeBarGroup(1, 6, AppPalette.primary),
                                _makeBarGroup(2, 10, AppPalette.primary),
                                _makeBarGroup(3, 8, AppPalette.secondary), // Peak day
                                _makeBarGroup(4, 12, AppPalette.secondary),
                                _makeBarGroup(5, 7, AppPalette.primary),
                                _makeBarGroup(6, 4, AppPalette.primary),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(width: 24),

                // Patients Chart (Line Chart for Trends or Pie for Demographics)
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppPalette.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText("Patient Growth", fontSize: 16, fontWeight: FW.semiBold),
                        const SizedBox(height: 24),
                        Expanded(
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(show: false),
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    const FlSpot(0, 3),
                                    const FlSpot(1, 1),
                                    const FlSpot(2, 4),
                                    const FlSpot(3, 2),
                                    const FlSpot(4, 5),
                                    const FlSpot(5, 3),
                                    const FlSpot(6, 6),
                                  ],
                                  isCurved: true,
                                  color: AppPalette.success,
                                  barWidth: 3,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(show: false),
                                  belowBarData: BarAreaData(show: true, color: AppPalette.success.withOpacity(0.1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText("New Patients: 24", fontWeight: FW.medium),
                            CustomText("+12% vs last week", color: AppPalette.success, fontSize: 11),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({required String title, required String value, required IconData icon, required Color color}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppPalette.border),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title, color: AppPalette.textSecondary, fontSize: 12),
                const SizedBox(height: 4),
                CustomText(value, fontSize: 20, fontWeight: FW.bold),
              ],
            ),
          ],
        ),
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
          width: 16,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }
}
