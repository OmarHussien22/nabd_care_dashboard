import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Constants/Strings/Assets/app_basic_icons.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Base/presentation/manager/base_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Spaces&Dividers/custom_divider.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class NavigationSideBar extends StatelessWidget {
  const NavigationSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
      builder: (controller) {
        final isCollapsed = !controller.isSidebarOpen;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isCollapsed ? 23.toW() : 60.toW(),
          decoration: BoxDecoration(
            color: AppColors.get.white,
            border: Border(
              right: BorderSide(
                color: AppColors.get.primary.withOpacity(0.4),
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              15.ESH(),
              _buildHeader(isCollapsed),
              2.3.ESH(),
              XDivider.normal(
                color: AppColors.get.primary,
              ),
              25.ESH(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Column(
                      children: [
                        _buildMainItem(
                          controller,
                          0,
                          icon: Icons.dashboard_outlined,
                          title: "Dashboard",
                          subTabs: ["Home Overview"],
                        ),
                        _buildMainItem(
                          controller,
                          1,
                          icon: Icons.shopping_cart_outlined,
                          title: "Products",
                          subTabs: [
                            "Categories",
                            "Subcategories",
                            "Products",
                          ],
                        ),
                        _buildMainItem(
                          controller,
                          2,
                          icon: Icons.attach_money_outlined,
                          title: "Sales",
                          subTabs: ["Sales List"],
                        ),
                        _buildMainItem(
                          controller,
                          3,
                          icon: Icons.settings_outlined,
                          title: "Settings",
                          subTabs: ["System Settings"],
                        ),
                     
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(bool isCollapsed) {
    final controller = Get.find<BaseController>();
    return Container(
      height: 65.toH(),
      padding: EdgeInsets.symmetric(horizontal: isCollapsed ? 0 : 6.toW()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // شعار أو اسم النظام
          Expanded(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 180),
              opacity: isCollapsed ? 0 : 1,
              child: isCollapsed
                  ? const SizedBox.shrink()
                  : Row(
                      children: [
                        ImageGeneric.asset(
                          url: AppBasicIcons.logo,
                          options: ImageOptions(
                              height: 40.toRad(),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        2.ESW(),
                        CustomText(
                          "Dreams POS",
                          fontSize: 4,
                          isOverFlow: true,
                          fontWeight: FW.bold,
                        ),
                      ],
                    ),
            ),
          ),

          // زر السهم
          InkWell(
            onTap: controller.toggleSidebar,
            hoverColor: AppColors.get.primary.withOpacity(0.7),
            hoverDuration: Duration(milliseconds: 200),
            highlightColor: Colors.transparent,
            child: Center(
              child: AnimatedRotation(
                turns: isCollapsed ? 0.5 : 0,
                duration: const Duration(milliseconds: 300),
                child: Row(
                  children: [
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 22,
                      color: AppColors.get.primary,
                    ),
                    if (isCollapsed) ...[
                      2.ESW(),
                      AnimatedRotation(
                        turns: 0.5,
                        duration: const Duration(milliseconds: 300),
                        child: ImageGeneric.asset(
                          url: AppBasicIcons.logo,
                          options: ImageOptions(
                              height: 38.toRad(),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainItem(
    BaseController controller,
    int index, {
    required IconData icon,
    required String title,
    required List<String> subTabs,
  }) {
    final isExpanded = controller.isMainExpanded(index);
    final isCollapsed = !controller.isSidebarOpen;

    return Column(
      children: [
        InkWell(
          onTap: () => controller.toggleExpand(index),
          child: Container(
            padding: EdgeInsets.all(12.toRad()),
            margin: EdgeInsets.symmetric(
              horizontal: 4.toH(),
            ),
            decoration: BoxDecoration(
              color: isExpanded
                  ? AppColors.get.amber.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8.toRad()),
            ),
            child: Row(
              children: [
                Icon(icon,
                    size: 18,
                    color: isExpanded
                        ? AppColors.get.amber
                        : AppColors.get.primary),
                if (!isCollapsed)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.toW()),
                      child: Row(
                        children: [
                          CustomText(
                            title,
                            fontSize: 5,
                            fontWeight: FW.normal,
                            color: isExpanded
                                ? AppColors.get.amber
                                : AppColors.get.primary,
                          ),
                          // if(!isExpanded)...[
                          // const Spacer(),
                          // Icon(
                          //   Icons.arrow_drop_down,
                          //   size: 20,
                          //   color: isExpanded ? AppColors.get.amber :AppColors.get.primary,
                          // ),
                          // ],
                        ],
                      ),
                    ),
                  ),
                if (!isCollapsed)
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      isExpanded ? Icons.arrow_drop_down : Icons.expand_more,
                      size: 18,
                      color: isExpanded
                          ? AppColors.get.amber
                          : AppColors.get.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: isExpanded && !isCollapsed
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: subTabs.asMap().entries.map((e) {
                    final subIndex = e.key;
                    final text = e.value;
                    final isSelected = controller.selectedMainIndex == index &&
                        controller.selectedSubIndex == subIndex;

                    return InkWell(
                      onTap: () => controller.changeTabIndex(index, subIndex),
                      child: Container(
                        alignment: Alignment.center,
                        //  padding: EdgeInsets.only(left: 40.toW(), top: 10.toH(), bottom: 10.toH()),
                       decoration: BoxDecoration(
                          // color: isSelected
                          //     ? AppColors.get.primary.withOpacity(0.2)
                          //     : Colors.transparent,
                         // borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: AppInsets.defaultScreenOnly(left: 4.toW()),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             CustomText(
                                "· ",
                                fontSize: 8,
                                color: isSelected ? AppColors.get.amber : AppColors.get.black,
                              ),
                              Expanded(
                                child: CustomText(
                                  text,
                                  fontSize: 4,
                                  color: isSelected ?AppColors.get.amber : AppColors.get.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
