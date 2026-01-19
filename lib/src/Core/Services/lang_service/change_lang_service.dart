// import 'package:easy_localization/easy_localization.dart';
import 'package:care_desk/src/Features/MainLayout/presentation/pages/main_layout_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
    Get.offAll(const MainLayoutPage());
  }
}
