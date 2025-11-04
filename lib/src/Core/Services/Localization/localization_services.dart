import 'package:getx_base_code/src/Core/Services/Localization/en_US.dart';
import 'package:getx_base_code/src/Core/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ar_EG.dart';

class LocalizationServices extends Translations {
  static Locale? get locale => Utils.cachedLocale ?? const Locale("ar ", "AE");
  static const fallBackLocale = Locale("en", "US");

  @override
  Map<String, Map<String, String>> get keys => {
        "ar_AE": arEG,
        "en_US": enUS,
      };
}

// class LocalizationServices extends Translations {
//   static const locale = Locale("en", "US");
//   static const fallBackLocale = Locale("en", "US");
//   static final StorageService box = StorageService();
//   static final langs = ["English", "Arabic"];
//   static final locales = [
//     const Locale("en", "US"),
//     const Locale("ar", "AE"),
//   ];
//
//   @override
//   Map<String, Map<String, String>> get keys => {
//         "ar_EG": arEG,
//         "en_US": enUS,
//       };
//
//   Locale? getLocaleFromLanguage(String lang) {
//     for (int i = 0; i < lang.length; i++) {
//       if (lang == langs[i]) return locales[i];
//     }
//     return Get.locale;
//   }
//
//   Locale getCurrentLocale() {
//     Locale defaultLocale;
//     printDM("box.read(lng) is 0 ${box.read("lng")}");
//     if (box.read("lng") != null) {
//       printDM("box.read(lng) is 1 ${box.read("lng")}");
//       final locale = getLocaleFromLanguage(box.read("lng"));
//       defaultLocale = locale!;
//     } else {
//       defaultLocale = const Locale("ar", "AE");
//     }
//     return defaultLocale;
//   }
//
//   String getCurrentLang() {
//     return box.read("lng") ?? 'English';
//   }
// }
