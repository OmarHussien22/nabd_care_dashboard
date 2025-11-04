import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/src/imports_text.dart';

import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Text/src/Options/imports_text_options.dart';

class HomeSalesGraphWidget extends StatelessWidget {
  const HomeSalesGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275.toW(),
      height: 350.toH(),
      padding: EdgeInsets.all(12.toRad()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.toRad()),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            "المبيعات خلال الأسبوع",
            fontSize: 5,
            fontWeight: FW.semiBold,
          ),
          10.ESH(),
          SizedBox(
            height: 260.toH(),
            width: 100.toW(),
            child: LineChart(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 250),
              LineChartData(
                gridData: FlGridData(show: false),
                backgroundColor: Colors.white,
                titlesData: FlTitlesData(
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: true)),
                  bottomTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: true)),
                ),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 10),
                      FlSpot(1, 20),
                      FlSpot(2, 30),
                      FlSpot(3, 25),
                      FlSpot(4, 40),
                      FlSpot(5, 45),
                      FlSpot(6, 50),
                    ],
                    // isStepLineChart: true,
                    showingIndicators: [0, 1, 2, 3, 4, 5, 6],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: true),
                    aboveBarData: BarAreaData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
