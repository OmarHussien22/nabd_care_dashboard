import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:care_desk/src/Core/Services/Storage/storage_service.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Shared/Entities/language.dart';

//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dar';
import '../Services/storage/src/storage_constants.dart';
// TODO : add the most main used functions here !

class Utils {
  Utils._();
  static final StorageService<int> _box = StorageService<int>();
  static Locale get cachedLocale {
    return LanguageData.locale(2
        //_box.read(stgLang) ?? 1,
        );
  }

  static Future<void> applyHapticFeedback({bool vibration = false}) async {
    if (vibration) {
      await HapticFeedback.vibrate();
    } else {
      await HapticFeedback.heavyImpact();
    }
  }

  static String translateLabel(String value) {
    return value.toTr();
  }
//   /// returns scanned qr code as a string
//   ///This method depends on [FlutterBarcodeScanner] package
//   /// requires extra steps for Ios configuration
//   static Future<String> scanQRCode({ScanMode scanMode = ScanMode.QR}) async {
//     String scannedQr;
//
//     ///TODO : add configuration to ios
//     try {
//       scannedQr = await FlutterBarcodeScanner.scanBarcode(
//         "#1196c1",
//         "cancel".tr,
//         true,
//         scanMode,
//       );
//     } on PlatformException {
//       scannedQr = "";
//     } catch (e) {
//       printDM("Error in scanning QR is : => $e");
//       scannedQr = "";
//     }
//     return scannedQr;
//   }
// }

  /// Allow you to copy [Text] to clipboard
  static Future<void> copyToClipboard(String text) async {
    // if (text.trim().isEmpty) {
    //   AppSnacks.showSnackNotificationBar(
    //     title: "",
    //     body: "",
    //   );
    //   return;
    // } else {
    //   Clipboard.setData(ClipboardData(text: text)).then((value) {
    //     AppSnacks.showSnackNotificationBar(
    //       title: "تم النسخ بنجاح",
    //       body: text,
    //     );
    //   });
    // }
  }

  /// ------------------------------ Snack -------------------------------------
  /// snackBar

  /// ------------------------------ toast --------------------------------------
  static final notificationSeen = StorageService<bool>();
  static void seenNotification() async {
    await notificationSeen.save(stgNotificationSeen, value: true);
  }

  static void unSeenNotification() async {
    await notificationSeen.save(stgNotificationSeen, value: false);
  }

  static bool fetchNotificationReadStatus() {
    return notificationSeen.read(stgNotificationSeen, defaultValue: false) ??
        false;
  }

  /// gets random number
  static int randomNumber({int nextInt = 1000}) {
    return math.Random().nextInt(nextInt) + 100;
  }
}
