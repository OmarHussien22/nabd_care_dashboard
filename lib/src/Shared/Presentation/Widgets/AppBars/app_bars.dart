import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:getx_base_code/src/Core/Constants/Strings/Assets/app_basic_icons.dart';
import 'package:getx_base_code/src/Core/Services/lang_service/translate_extension.dart';
import 'package:getx_base_code/src/Core/Styles/Colors/app_colors.dart';
import 'package:getx_base_code/src/Core/Styles/Themes/theme_switch_button.dart';
import 'package:getx_base_code/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:getx_base_code/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:getx_base_code/src/Shared/Caches/user_cache_local.dart';
import 'package:getx_base_code/src/Shared/Managers/user_local_controller.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';

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

//// Custom fixed AppBar System for all pages in the app

class FixedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FixedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.get.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.get.shadow.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // شعار النظام
          // Row(
          //   children: [
          //     ImageGeneric.asset(
          //       url: AppBasicIcons.logo,

          //     ),
          //     const SizedBox(width: 10),
          //     CustomText(
          //       "Dreams POS",
          //       fontSize: 5,
          //       color: AppColors.get.title,
          //       fontWeight: FW.bold,
          //     ),
          //   ],
          // ),

          // حقل بحث بسيط

          SizedBox( 
            width: 75.toW(),
            child: Padding(
              padding: AppInsets.defaultScreenOnly(top: 12.toH()),
              child: TextFieldDefault(
                
                hint: TFFHint(title: "search..".toTr(), fontSize: 5),
                prefix: PrefixWithIconData(
                  iconData: Icons.search,
                  color: AppColors.get.tTFPrefixColor,
                  size: 15,
                ),
                controller: TextEditingController(),
                inputDecoration: InputDecorationWithBorder(
                  enableBorderColor: AppColors.get.greyLight,
                ),
              ),
            ),
          ),
          // const SizedBox(width: 20),
          const Spacer(),
          // زر الوضع الليلي
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomText(
                    "hello,",
                    fontSize: 5,
                  ),
                  CustomText(
                    UserLocalController.get.user!.name ?? "",
                    fontSize: 5,
                  ),
                ],
              ),
              4.ESW(),
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.red),
                onPressed: () {
                  UserCacheLocal.instance.logout();
                  Get.offAll(() => LoginPage(),
                      duration: const Duration(milliseconds: 500),
                      transition: Transition.fadeIn);
                  // ClientSnacks.logoutSuccess();
                },
              ),
              4.ESW(),
              ThemeSwitchButton(),
            ],
          ),

          const SizedBox(width: 15),

          // أيقونة المستخدم
          CircleAvatar(
            backgroundColor: AppColors.get.primary.withOpacity(0.1),
            child: Icon(Icons.person, color: AppColors.get.primary),
          ),
        ],
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
