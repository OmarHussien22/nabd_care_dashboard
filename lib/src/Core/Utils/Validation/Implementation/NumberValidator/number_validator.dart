import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';

import '../../Abstract/validator_imp.dart';

class NumberValidator extends ValidatorImp {
  NumberValidator._();

  static NumberValidator get instance => NumberValidator._();

  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    final valueAsNum = int.tryParse(value?.replaceAll(
          RegExp(r'[^0-9]'),
          '',
        ) ??
        '');
    if (value == null || value.isEmpty) {
      return 'number_not_empty'.toTr();
    }
    if (valueAsNum == null) {
      return 'number_not_correct'.toTr();
    }
    if (valueAsNum < 1) {
      return 'number_not_minus'.toTr();
    }
    return null;
  }
}
