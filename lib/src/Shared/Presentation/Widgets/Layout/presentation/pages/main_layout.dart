import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/AppBars/app_bars.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/manager/main_layout_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/siderbar/side_bar.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  // final VoidCallback? onLogout;

  const MainLayout({
    super.key,
    required this.child,
    // this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MainLayoutController());
    return GetBuilder<MainLayoutController>(
      id: 'main_layout',
      builder: (cnt) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isWide = screenWidth >= 900;

        if (!isWide) {
          return Scaffold(
            backgroundColor: AppColors.get.background,
            appBar: const MainAppBar(),
            drawer: const Sidebar(),
            drawerEnableOpenDragGesture: true,
            body: child,
          );
        }

        return Scaffold(
          backgroundColor: AppColors.get.background,
          body: Row(
            children: [
              if (!cnt.isCollapsed) const Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    const MainAppBar(),
                    Expanded(child: child),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
