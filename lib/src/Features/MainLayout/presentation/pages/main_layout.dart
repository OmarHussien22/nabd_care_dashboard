import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/controller/main_layout_controller.dart';
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
                          _buildTopAppBar(),
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

  Widget _buildTopAppBar() {
    final cnt = Get.find<MainLayoutController>();
    return Container(
      height: 64,
      color: AppPalette.surface,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Path / Breadcrumb (Simple Title for now)
          CustomText(
            cnt.getPageTitle(cnt.selectedIndex),
            fontSize: 18,
            fontWeight: FW.bold,
            color: AppPalette.textPrimary,
          ),

          const Spacer(),

          // Mock Controls for Demo
          IconButton(
            icon: Icon(cnt.isOffline ? Icons.wifi_off : Icons.wifi,
                color: AppPalette.textSecondary),
            tooltip: "Toggle Mock Offline Mode",
            onPressed: () => cnt.toggleNetworkStatus,
          ),
          const SizedBox(width: 16),

          // Doctor Selector
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppPalette.background,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppPalette.border),
            ),
            child: Row(
              children: const [
                CircleAvatar(
                    radius: 10,
                    backgroundColor: AppPalette.primary,
                    child: Icon(Icons.person, size: 12, color: Colors.white)),
                SizedBox(width: 8),
                CustomText("Dr. Sarah Bennett",
                    fontSize: 13, fontWeight: FW.medium),
                SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down,
                    size: 16, color: AppPalette.textSecondary)
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Sync Indicator
          SyncIndicator(
            state: cnt.isOffline ? SyncState.offline : SyncState.online,
            lastSyncTime: DateTime.now(),
          ),

          const SizedBox(width: 16),

          // Profile
          const CircleAvatar(
            radius: 16,
            backgroundColor: AppPalette.surfaceContainer,
            child: Icon(Icons.person_outline, color: AppPalette.textPrimary),
          ),
        ],
      ),
    );
  }
}
