import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/MainLayout/controller/main_layout_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/AppBars/app_bars.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/widgets/offline_banner.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/widgets/sidebar.dart';
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
        builder: (cnt) {
          return Column(
            children: [
              if (cnt.isOffline) OfflineBanner(onRetry: cnt.onRetry),
              Expanded(
                child: Row(
                  children: [
                    Sidebar(
                      isCollapsed: cnt.isSidebarCollapsed,
                      onToggle: cnt.toggleSidebar,
                      selectedIndex: cnt.selectedIndex,
                      onItemSelected: cnt.selectItem,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          FixedAppBar(),
                          Divider(height: 1, color: AppColors.get.border),
                          Expanded(
                            child: Container(
                                padding: AppInsets.defaultScreenALL,
                                color: AppColors.get.lighterGrey,
                                child: GetRouterOutlet(
                                  initialRoute: AppRoutes.dashboard,
                                  anchorRoute: AppRoutes.mainApp,
                                  // الـ anchorRoute يضمن بقاء الـ URL متسلسلاً
                                )),
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
