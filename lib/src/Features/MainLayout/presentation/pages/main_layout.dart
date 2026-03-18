import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/MainLayout/controller/main_layout_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/AppBars/app_bars.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/widgets/offline_banner.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/widgets/sidebar.dart';
import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainLayoutController());

    return Scaffold(
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
                    // ── Content area with its own nested Navigator ─────────
                    Expanded(
                      child: Column(
                        children: [
                          FixedAppBar(),
                          Divider(height: 1, color: AppColors.get.border),
                          Expanded(
                            child: Material(
                              color: AppColors.get.lighterGrey,
                              // A nested Navigator: pages push/pop inside here
                              // while the Sidebar stays completely outside and
                              // is NEVER rebuilt during navigation.
                              child: Navigator(
                                key: dashboardNavigatorKey,
                                initialRoute: AppRoutes.dashboard,
                                observers: [
                                  sidebarRouteObserver,
                                  NavigationStackObserver(),
                                ],
                                onGenerateRoute:
                                    MainLayoutController.onGenerateInnerRoute,
                              ),
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
    );
  }
}
