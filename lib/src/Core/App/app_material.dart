import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Constants/Strings/app_strings.dart';
import 'package:care_desk/src/Core/Libraries/snap/src/snap_main.dart';
import 'package:care_desk/src/Core/Libraries/snap/src/snap_router/route_generator.dart';
import 'package:care_desk/src/Core/Services/Localization/localization_services.dart';
import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:care_desk/src/Core/Styles/Themes/imports_themes.dart';
import 'package:care_desk/src/Core/Styles/Themes/theme_controller.dart';
import 'package:care_desk/src/Core/Utils/utils.dart';

class AppMaterial extends StatelessWidget {
  // final Widget home;
  final String initPage;

  const AppMaterial({super.key, required this.initPage});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.pages;

    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          scaffoldMessengerKey: Snap.messengerKey,
          onGenerateRoute: RouterGenerator().goRoutes,
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 200),
          translations: LocalizationServices(),
          locale: Utils.cachedLocale, //const Locale('ar', 'AR'),
          title: AppStrings.appName,
          theme: ThemeManager.light,
          darkTheme: ThemeManager.dark,
          themeMode: controller.themeMode,
          initialRoute: initPage,
          navigatorObservers: [NavigationStackObserver()],
          getPages: router,
          // home: home,
          builder: (context, child) => child!,
        );
      },
    );
  }
}
