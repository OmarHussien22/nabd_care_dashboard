import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Loading/loading_shimmer.dart';
import 'package:flutter/material.dart';

class PatientDetailsLoadingView extends StatelessWidget {
  const PatientDetailsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.get.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 210,
              backgroundColor: AppColors.get.primary,
              flexibleSpace: const FlexibleSpaceBar(background: SizedBox()),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(24),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _LoadingCard(height: 170),
                    const SizedBox(height: 18),
                    _LoadingCard(height: 120),
                    const SizedBox(height: 18),
                    _LoadingCard(height: 240),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  final double height;

  const _LoadingCard({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.get.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.get.border),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomBuildShimmerLoading(),
            SizedBox(height: 18),
            CustomBuildShimmerLoading(),
          ],
        ),
      ),
    );
  }
}

