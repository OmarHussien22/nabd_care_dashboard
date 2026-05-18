import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/widgets/siderbar/side_bar_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Layout/presentation/manager/main_layout_controller.dart';

import '../../../../../../../Core/Styles/Colors/app_colors.dart';
import '../../../../../../../Core/Utils/Extensions/screen_spaces_extension.dart';
import '../../../../GeneralWidgets/Text/custom_text_lib.dart';
import '../../../domain/entity/side_bar_item_entity.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth >= 900;
    return Container(
      width: isWide ? 230.toW() : 500.toW(),
      decoration: BoxDecoration(
        color: AppColors.get.surface,
        border: Border(
          right: BorderSide(color: AppColors.get.border.withOpacity(0.5)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 20,
            offset: const Offset(4, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          32.ESH(),
          _buildLogo(context),
          40.ESH(),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.toW()),
              itemBuilder: (context, index) {
                final item = SideBarItemEntity.defaultItems[index];
                final selected = location == item.route ||
                    (item.route != '/dashboard' &&
                        location.startsWith(item.route));
                return SidebarTile(item: item, selected: selected);
              },
              separatorBuilder: (_, __) => 8.ESH(),
              itemCount: SideBarItemEntity.defaultItems.length,
            ),
          ),
          _buildUpgradeCard(),
          24.ESH(),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.toW()),
      child: Row(
        children: [
          Container(
            height: 42.toH(),
            width: 42.toH(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.get.primary,
                  AppColors.get.primary.withRed(50)
                ],
              ),
              borderRadius: BorderRadius.circular(12.toRad()),
              boxShadow: [
                BoxShadow(
                  color: AppColors.get.primary.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.local_hospital_rounded,
                color: Colors.white, size: 24),
          ),
          16.ESW(),
          Expanded(
            child: CustomText(
              'CareDesk',
              fontSize: 20.toFS(),
              fontWeight: FW.bold,
              color: AppColors.get.textPrimary,
            ),
          ),
          GetBuilder<MainLayoutController>(
            id: 'main_layout',
            builder: (cnt) {
              final screenWidth = MediaQuery.of(context).size.width;
              final isWide = screenWidth >= 900;
              if (isWide && cnt.isCollapsed) {
                return IconButton(
                  onPressed: () {
                    cnt.toggleCollapse();
                    if (Scaffold.of(context).isDrawerOpen) {
                      context.pop();
                    }
                  },
                  icon: Icon(Icons.push_pin_outlined,
                      color: AppColors.get.textSecondary, size: 20.toRad()),
                  tooltip: 'Pin Sidebar',
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUpgradeCard() {
    return Container(
      margin: EdgeInsets.all(16.toRad()),
      padding: EdgeInsets.all(20.toRad()),
      decoration: BoxDecoration(
        color: AppColors.get.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.toRad()),
        border: Border.all(color: AppColors.get.primary.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('Upgrade to Pro',
              fontWeight: FW.bold,
              fontSize: 14,
              color: AppColors.get.textPrimary),
          8.ESH(),
          CustomText('Get more features and support.',
              fontSize: 12, color: AppColors.get.textSecondary),
          16.ESH(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.get.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.toRad())),
              ),
              child: const Text('Upgrade Now'),
            ),
          ),
        ],
      ),
    );
  }
}
