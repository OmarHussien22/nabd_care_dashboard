import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Features/MainLayout/controller/main_layout_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/AppBars/app_bars.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/widgets/offline_banner.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  final Widget? child;
  const MainLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale?.languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.get.background,
        body: GetBuilder<MainLayoutController>(
          builder: (controller) {
            return Column(
              children: [
                if (controller.isOffline)
                  OfflineBanner(onRetry: controller.onRetry),
                Expanded(
                  child: Row(
                    children: [
                      // ── Persistent Sidebar ─────────────────────────────────
                      Sidebar(
                        isCollapsed: controller.isSidebarCollapsed,
                        onToggle: controller.toggleSidebar,
                        selectedIndex: controller.selectedIndex,
                        onItemSelected: controller.selectItem,
                      ),
                      // ── Content area ───────────────────────────────────────
                      Expanded(
                        child: Column(
                          children: [
                            const FixedAppBar(),
                            Divider(height: 1, color: AppColors.get.border),
                            Expanded(
                              child: Material(
                                color: AppColors.get.lighterGrey,
                                child: child ?? const SizedBox.shrink(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
