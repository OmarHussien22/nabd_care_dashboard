import 'dart:async';

import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/App/app_layout.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/helper/data_base_helper.dart';
import 'package:care_desk/src/Core/NetworkStructure/Networking/network_service.dart';
import 'package:care_desk/src/Core/Services/Storage/storage_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../Shared/Presentation/Widgets/Error/app_error_builder.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();


    ErrorWidget.builder =
        (FlutterErrorDetails details) => AppErrorBuilder(details);

    /// * Storage Service Initialization
    await StorageService().init();

    /// * Http Client Configuratio
    
    //HttpOverrides.global = MyHttpOverrides();

    /// * ScreenShot Configuration
    // Helper.screenShot.secureApp();

    /// * Network Service Initialization
    ///
    /// ✅ **Initialize sqflite_common_ffi (for Windows, Linux, and MacOS)**
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    //* delete existing database for testing
    // await DatabaseHelper.instance.deleteDatabase();
    await DatabaseHelper.instance.database;
    NetworkService().init();

    /// * App Orientation Configuration
    await AppLayout.fixedOrientation();
  }
}
