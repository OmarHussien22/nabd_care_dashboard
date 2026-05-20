import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/Services/Storage/storage_service.dart';
import 'package:care_desk/src/Core/Services/storage/src/storage_constants.dart';
import 'package:care_desk/src/Shared/Entities/language.dart';

class ChangeLangService {
  ChangeLangService._();
  static ChangeLangService get instance => ChangeLangService._();

  /// id = 1  => Lang = Arabic
  /// id = 2 => lang = eng
  void changeLang({required int id, required BuildContext context}) async {
    final StorageService<int> box = StorageService<int>();
    await box.save(stgLang, value: id);

    final Locale locale = LanguageData.locale(id);
    Get.updateLocale(locale);
  }
}
