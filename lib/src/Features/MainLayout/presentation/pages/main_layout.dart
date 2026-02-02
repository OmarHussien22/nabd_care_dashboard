import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/controller/main_layout_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/AppBars/app_bars.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/offline_banner.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/sidebar.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/sync_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainLayoutController());
    return Scaffold(
      backgroundColor: AppPalette.background,
      body: GetBuilder<MainLayoutController>(
        builder: (cnt) {
          return Column(
            children: [
              // Offline Banner
              if (cnt.isOffline) OfflineBanner(onRetry: cnt.onRetry),
              // Main Content
              Expanded(
                child: Row(
                  children: [
                    // Start: Sidebar
                    Sidebar(
                      isCollapsed: cnt.isSidebarCollapsed,
                      onToggle: cnt.toggleSidebar,
                      selectedIndex: cnt.selectedIndex,
                      onItemSelected: cnt.selectItem,
                    ),
                    // End: Sidebar

                    Expanded(
                      child: Column(
                        children: [
                          // Header

                          FixedAppBar(),
                          const Divider(height: 1, color: AppPalette.border),

                          // Page Content
                          Expanded(
                            child: cnt.pages[cnt.selectedIndex] ??
                                const Center(
                                    child: CustomText("Page not found")),
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
