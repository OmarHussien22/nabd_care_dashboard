import 'package:care_desk/src/Shared/Entities/language.dart';
import 'package:flutter/material.dart';

class LanguageModel extends Language {
  LanguageModel({
    super.id,
    super.flag,
    String? lagTitle,
    Locale? locale,
  }) : super(langTitle: lagTitle, locale: locale!);
}
