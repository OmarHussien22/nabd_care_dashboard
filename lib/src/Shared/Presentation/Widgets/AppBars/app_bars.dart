import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/MainLayout/controller/main_layout_controller.dart';
import 'package:care_desk/src/Features/common/widgets/custom_search_field.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/widgets/sync_indicator.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Constants/Strings/Assets/app_basic_icons.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

import '../GeneralWidgets/Buttons/Customizable/imports_customizable.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  final AppBar _appBar;
  final double? toolbarHeight;
  final double? bottomHeight;

  const AppBars._(
    this._appBar, {
    super.key,
    this.toolbarHeight,
    this.bottomHeight,
  });

  @override
  Widget build(BuildContext context) {
    return _appBar;
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);

  // factory AppBars.search(BuildContext context) {
  //   return AppBars._(
  //     AppBar(
  //         toolbarHeight: 170.toH(),
  //         backgroundColor: Colors.transparent,
  //         automaticallyImplyLeading: false,
  //         // flexibleSpace: SearchWidget(),
  //         bottom: const PreferredSize(preferredSize: Size.fromHeight(70), child: SearchWidget())),
  //     // toolbarHeight: (230.toH()),
  //   );
  // }

  factory AppBars.logo({
    double? toolbarHeight,
    Widget? child,
    bool? centerTitle = true,
    List<Widget>? actions,
  }) {
    return AppBars._(AppBar(
      toolbarHeight: (toolbarHeight ?? kToolbarHeight).toH(),
      centerTitle: centerTitle,
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: 10.toW()),
        child: child ??
            Image.asset(
              AppBasicIcons.logo,
              fit: BoxFit.contain,
              height: 80,
              width: 80,
            ),
      ),
      actions: actions,
    ));
  }

  factory AppBars.basic({
    String? title,
    List<Widget>? actions,
    double? toolbarHeight,
    Widget? titleWidget,
    bool? centerTitle,
    Color? titleColor,
    bool isTitleBold = false,
    bool isBack = true,
    Widget? leading,
    double? elevation,
    double? fontSize,
    Color? arrowBackColor,
  }) {
    return AppBars._(
      AppBar(
        title: titleWidget ??
            CustomText(
              title ?? "",
              isBold: isTitleBold,
              color: titleColor ?? AppColors.get.black,
              fontSize: fontSize ?? 10,
              fontWeight: isTitleBold ? FW.bold : FW.semiBold,
            ),
        actions: actions,
        centerTitle: centerTitle ?? true,
        shadowColor: AppColors.get.shadow,
        elevation: elevation ?? 0,
        backgroundColor: AppColors.get.background,
        leading:
            isBack ? ButtonBack(color: arrowBackColor) : leading ?? 0.ESH(),
      ),
      toolbarHeight: (toolbarHeight ?? kToolbarHeight).toH(),
    );
  }

  factory AppBars.colored({
    String? title,
    List<Widget>? actions,
    double? toolbarHeight,
    Widget? titleWidget,
    bool? centerTitle,
    Color? titleColor,
    bool isTitleBold = false,
    bool isBack = true,
    Widget? leading,
  }) {
    return AppBars._(
      AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.get.secondaryColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: titleWidget ??
            CustomText(
              title ?? "",
              isBold: isTitleBold,
              color: titleColor ?? AppColors.get.black,
              fontSize: 14,
              fontWeight: FW.semiBold,
            ),
        actions: actions,
        centerTitle: centerTitle ?? true,
        shadowColor: AppColors.get.shadow,
        elevation: 0,
        backgroundColor: AppColors.get.secondaryColor,
        leading: isBack
            ? IconButton(
                onPressed: () => Get.back(),
                splashRadius: 20.toRad(),
                icon: Icon(
                  Icons.arrow_back_outlined,
                  size: 24.toRad(),
                ),
                color: AppColors.get.opposite,
              )
            : leading ?? 0.ESH(),
      ),
      toolbarHeight: (toolbarHeight ?? kToolbarHeight).toH(),
    );
  }
}

class FixedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FixedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.toH(),
      color: AppColors.get.surface,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: GetBuilder<MainLayoutController>(
        builder: (cnt) {
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  cnt.toggleSidebar(!cnt.isSidebarCollapsed);
                },
                icon: Icon(Icons.menu, color: AppColors.get.textSecondary),
              ),
              5.ESH(),
              CustomText(
                cnt.getPageTitle(cnt.selectedIndex),
                fontSize: 18,
                fontWeight: FW.bold,
                color: AppColors.get.textPrimary,
              ),
              const Spacer(),
              CustomSearchField(),
              const Spacer(),
              if (cnt.selectedIndex != 2) ...[
                ButtonDefault.icon(
                  width: 150.toW(),
                  //padding: AppInsets.defaultButtonVertical,
                  onPressed: () {
                    cnt.pushPage(AppRoutes.addPatient);
                  },
                  titleSize: 14,
                  borderRadius: AppInsets.buttonBorderRadius,
                  icon: Icons.person_add,
                  label: "add_patient",
                ),
                10.ESW()
              ],
              Container(
                height: 45.toH(),
                decoration: BoxDecoration(
                  color: AppColors.get.lighterGrey,
                  // shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.get.cardBorder, width: 0),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: AppColors.get.textSecondary,
                  ),
                ),
              ),
              // Doctor Selector
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              //   decoration: BoxDecoration(
              //     color: AppPalette.background,
              //     borderRadius: BorderRadius.circular(8),
              //     border: Border.all(color: AppPalette.border),
              //   ),
              //   child: Row(
              //     children: const [
              //       CircleAvatar(
              //           radius: 10,
              //           backgroundColor: AppPalette.primary,
              //           child: Icon(Icons.person, size: 12, color: Colors.white)),
              //       SizedBox(width: 8),
              //       CustomText("Dr. Sarah Bennett",
              //           fontSize: 13, fontWeight: FW.medium),
              //       SizedBox(width: 8),
              //       Icon(Icons.keyboard_arrow_down,
              //           size: 16, color: AppPalette.textSecondary)
              //     ],
              //   ),
              // ),

              // const SizedBox(width: 16),

              // Sync Indicator
              // SyncIndicator(
              //   state: cnt.isOffline ? SyncState.offline : SyncState.online,
              //   lastSyncTime: DateTime.now(),
              // ),

              const SizedBox(width: 16),
              // Mock Controls for Demo
              // IconButton(
              //   icon: Icon(cnt.isOffline ? Icons.wifi_off : Icons.wifi,
              //       color: AppColors.get.textSecondary),
              //   tooltip: "Toggle Mock Offline Mode",
              //   onPressed: () => cnt.toggleNetworkStatus,
              // ),
              // Profile
              // const CircleAvatar(
              //   radius: 16,
              //   backgroundColor: AppPalette.surfaceContainer,
              //   child: Icon(Icons.person_outline, color: AppPalette.textPrimary),
              // ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

///todo Custom Container in apppbar of icons

class CustomContainerIcons extends StatelessWidget {
  const CustomContainerIcons(
      {super.key, required this.child, this.width, this.height});
  final Widget child;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 35,
      height: height ?? 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.get.grey,
          width: 0.2,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
