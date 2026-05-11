import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter/material.dart';
import 'dashboard_card.dart';

class DashboardSkeleton extends StatelessWidget {
  const DashboardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSkeletonBox(width: 300, height: 32),
          8.ESH(),
          _buildSkeletonBox(width: 450, height: 16),
          32.ESH(),
          Row(
            children: List.generate(
              4,
              (index) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: index == 3 ? 0 : 20.toW()),
                  child: const DashboardCard(
                    height: 140,
                    child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  ),
                ),
              ),
            ),
          ),
          40.ESH(),
          Row(
            children: [
              Expanded(flex: 2, child: _buildSkeletonBox(height: 350)),
              24.ESW(),
              Expanded(flex: 1, child: _buildSkeletonBox(height: 350)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonBox({double? width, double height = 100}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.get.background,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
