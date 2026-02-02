
import 'package:care_desk/ai_app/ai_page.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:care_desk/src/Features/Base/presentation/pages/base_page.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/pages/main_layout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_desk/src/Core/App/app_material.dart';
import 'package:care_desk/src/Core/Constants/Decorations/app_sizes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    printDM('state: $state', name: 'AppLifecycleState');
  }

  @override
  Widget build(BuildContext context) {
    // final CheckNetworkController checkNetworkController = Get.put(
    //   CheckNetworkController(),
    //   permanent: true,
    // );
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: AppSizes.screenSize,
        minTextAdapt: true,
        builder: (context, child) {
          child = AppMaterial(home:const BasePage());
          return child;
        },
      ),
    );
  }
}
