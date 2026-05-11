import 'package:care_desk/src/Core/routers/go_router/app_go_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Constants/Strings/app_strings.dart';
import 'package:care_desk/src/Core/Libraries/snap/src/snap_main.dart';
import 'package:care_desk/src/Core/Services/Localization/localization_services.dart';
import 'package:care_desk/src/Core/Styles/Themes/imports_themes.dart';
import 'package:care_desk/src/Core/Styles/Themes/theme_controller.dart';
import 'package:care_desk/src/Core/Utils/utils.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: Snap.messengerKey,
          routerDelegate: AppGoRouter.router.routerDelegate,
          routeInformationParser: AppGoRouter.router.routeInformationParser,
          routeInformationProvider: AppGoRouter.router.routeInformationProvider,
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 200),
          translations: LocalizationServices(),
          locale: Utils.cachedLocale, //const Locale('ar', 'AR'),
          title: AppStrings.appName,
          theme: ThemeManager.light,
          darkTheme: ThemeManager.dark,
          themeMode: controller.themeMode,
          builder: (context, child) => child!,
        );
      },
    );
  }
}
