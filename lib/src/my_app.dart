import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_base_code/src/Core/App/app_material.dart';
import 'package:getx_base_code/src/Core/Constants/Decorations/app_sizes.dart';
import 'package:getx_base_code/src/Features/Splash/presentation/pages/splash_imports.dart';

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
    log('state: $state', name: 'AppLifecycleState');
    // TODO: logic - implement didChangeAppLifecycleState
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
          child = AppMaterial(home: SplashPage());
          return child;
        },
      ),
    );
  }
}
