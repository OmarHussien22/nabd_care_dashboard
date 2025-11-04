// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Features/Splash/presentation/pages/splash_imports.dart';

class ChangeLangService {
  ChangeLangService._();
  static ChangeLangService get instance => ChangeLangService._();

  /// id = 1  => Lang = Arabic
  /// id = 2 => lang = eng
  void changeLang({required int id, required BuildContext context}) async {
    // if (id == 1) {
    //   await context.setLocale(L10n.all[0]);
    // } else if (id == 2) {
    //   context.setLocale(L10n.all[1]);
    // }
    Get.offAll(const SplashPage());
  }
}
