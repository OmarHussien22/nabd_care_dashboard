import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';

String kDummyData = Platform.isAndroid
    ? ""
    //? "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى ...هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى ..."
    : "";

class AppStrings {
  AppStrings._();
  static const String appName = 'CareDesk';
  static const String appDescription = 'CareDesk Clinic Management System';
  static const String appLegalese = 'Ⓒ2025 $appName ';
  static const String androidIconPath = '@mipmap/ic_launcher';
  static const String fontFamily = "Cairo";
  static const String fontFamilySecondary = "";
  static const String appIcon = "assets/app_icons/logo.png";
  static const String appAndroidVersion = "1.0.0 +1";
  static const String appDesktopVersion = "1.0.0 +1";
  static const String appIOSVersion = "1.0.0";
  static const String appVersion = '1.0.0 +1';
  static const String appBuildNumber = '1';
  static const String _appStoreId = 'com.example.care_desk';
  static const String playStoreUrl =
      'https://play.google.com/store/apps/details?id=$appName';
  static const String appStoreUrl =
      'https://apps.apple.com/us/app/$appName/id$_appStoreId';
  static const String appID = 'com.example.care_desk';
  static const String mapKey = '';
  static const String fcnToken = '';
  static const String appStoreID = '';
  static const String apiKeyMap = "AIzaSyDs2ePgl_wNl3RIJLzkUhTEcvPsjeB0u7c";
  static const int localAppAndroidVersion = 1;
  static const int localAppIosVersion = 1;
  static const String dbName = "store.db";
  static const int dbVersion = 1;

  static String inviteCode = "send_code_to_invite_friends".toTr();
}

String get getOS => kIsWeb ? 'web' : Platform.operatingSystem;

String get ios => "ios";

String get android => "android";
String get windows => "windows";
String get linux => "linux";
String get macos => "macos";
