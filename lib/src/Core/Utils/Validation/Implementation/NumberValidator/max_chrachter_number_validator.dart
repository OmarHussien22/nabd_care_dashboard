import '../../validation_constants.dart';

import '../../Abstract/validator_imp.dart';

class MaxCharacterNumberValidator extends ValidatorImp {
  MaxCharacterNumberValidator._();

  static MaxCharacterNumberValidator get instance =>
      MaxCharacterNumberValidator._();

  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    if (value!.isNotEmpty) {
      if (value.length > 66) {
        return ValidationConstants.validateMaxNumberCharacter;
      } else {
        return null;
      }
    } else {
      return ValidationConstants.emptyData;
    }
  }
}
