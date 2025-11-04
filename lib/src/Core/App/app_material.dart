import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/Constants/Strings/app_strings.dart';
import 'package:getx_base_code/src/Core/Libraries/snap/src/snap_main.dart';
import 'package:getx_base_code/src/Core/Libraries/snap/src/snap_router/route_generator.dart';
import 'package:getx_base_code/src/Core/Services/Localization/localization_services.dart';
import 'package:getx_base_code/src/Core/Styles/Themes/imports_themes.dart';
import 'package:getx_base_code/src/Core/Styles/Themes/theme_controller.dart';
import 'package:getx_base_code/src/Core/Utils/utils.dart';

class AppMaterial extends StatelessWidget {
  final Widget home;
  const AppMaterial({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: Snap.key,
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
          home: home,
        );
      },
    );
  }
}
