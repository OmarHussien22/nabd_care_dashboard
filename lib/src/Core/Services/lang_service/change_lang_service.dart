// import 'package:easy_localization/easy_localization.dart';
import 'package:care_desk/src/Core/Services/Navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';

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
    NavigationService.instance.go('/dashboard');
  }
}
