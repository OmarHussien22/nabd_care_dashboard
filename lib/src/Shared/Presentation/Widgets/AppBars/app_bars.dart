import 'package:care_desk/src/Core/Utils/Extensions/extract_string.dart';
import 'package:care_desk/src/Shared/Caches/user_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:care_desk/src/Core/Constants/Strings/Assets/app_basic_icons.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';

import '../GeneralWidgets/Buttons/Customizable/imports_customizable.dart';
import '../Layout/presentation/manager/main_layout_controller.dart';
import '../Layout/presentation/widgets/global_search_field.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Services/lang_service/change_lang_service.dart';
import 'package:care_desk/src/Shared/Entities/language.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/dialogs/animate_dialogs.dart';

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
                onPressed: () => NavigationService.instance.pop(),
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

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(80.toH());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isWide = screenWidth >= 900;

    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 12.toW() : 24.toW()),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.get.border.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          GetBuilder<MainLayoutController>(
            id: 'main_layout',
            builder: (cnt) {
              return IconButton(
                onPressed: () {
                  if (isWide) {
                    cnt.toggleCollapse();
                  } else {
                    Scaffold.of(context).openDrawer();
                  }
                },
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: RotationTransition(
                        turns: animation,
                        child: child,
                      ),
                    );
                  },
                  child: Icon(
                    isWide
                        ? (cnt.isCollapsed ? Icons.menu : Icons.menu_open)
                        : Icons.menu,
                    key: ValueKey<bool>(cnt.isCollapsed),
                    color: AppColors.get.black,
                    size: 26.toRad(),
                  ),
                ),
                tooltip: 'toggle_sidebar'.tr,
              );
            },
          ),
          if (isMobile) 8.ESW() else 16.ESW(),
          Expanded(
            child: GlobalSearchField(
              items: const [
                'Mohamed Ali',
                'Omnia Swidan',
                'Ahmed Youssef',
                'kenzy Omar',
                'Omar Hassan',
              ],
            ),
          ),
          if (isMobile) 8.ESW() else 20.ESW(),
          _buildActionIcon(
            Icons.notifications_none_outlined,
            'Notifications',
            3,
            size: isMobile ? 22.toRad() : 24.toRad(),
          ),
          if (!isMobile) ...[
            12.ESW(),
            _buildActionIcon(
              Icons.chat_bubble_outline_rounded,
              'Messages',
              null,
              size: 22.toRad(),
            ),
          ],
          if (isMobile) 8.ESW() else 20.ESW(),
          _buildLanguageDropdown(context, isMobile),
          if (isMobile) 8.ESW() else 20.ESW(),
          _buildUserProfile(isMobile),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, String tooltip, int? badgeCount,
      {double? size}) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon:
              Icon(icon, color: AppColors.get.textSecondary, size: size ?? 20),
          tooltip: tooltip,
        ),
        if (badgeCount != null)
          Positioned(
            top: 1,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  color: Colors.red, shape: BoxShape.circle),
              constraints: const BoxConstraints(minWidth: 12, minHeight: 14),
              child: Center(
                child: Text(
                  badgeCount.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildUserProfile(bool isMobile) {
    final name = UserCache().data?.name ?? 'User Name';
    return InkWell(
      onTap: () => NavigationService.instance.go('/profile'),
      borderRadius: BorderRadius.circular(12.toRad()),
      child: Padding(
        padding: EdgeInsets.all(4.toRad()),
        child: Row(
          children: [
            if (!isMobile) ...[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(name, fontWeight: FW.bold, fontSize: 12),
                ],
              ),
              12.ESW(),
            ],
            CircleAvatar(
              radius: 18.toRad(),
              backgroundColor: AppColors.get.primary.withOpacity(0.1),
              child: CustomText(
                ExtractString.getInitials(name),
                fontSize: 11,
                fontWeight: FW.bold,
                color: AppColors.get.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageDropdown(BuildContext context, bool isMobile) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.translate,
        color: AppColors.get.textSecondary,
        size: isMobile ? 22.toRad() : 24.toRad(),
      ),
      tooltip: 'display_language'.tr,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.toRad()),
      ),
      onSelected: (int id) {
        ChangeLangService.instance.changeLang(id: id, context: context);
        Dialogs.customToast(
          text: 'language_changed_successfully'.tr,
          context: context,
          isSuccess: true,
        );
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: [
              Text('🇺🇸', style: TextStyle(fontSize: 18.toFS())),
              12.ESW(),
              const CustomText('English', fontWeight: FW.medium),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: [
              Text('🇸🇦', style: TextStyle(fontSize: 18.toFS())),
              12.ESW(),
              const CustomText('العربية', fontWeight: FW.medium),
            ],
          ),
        ),
      ],
    );
  }
}
