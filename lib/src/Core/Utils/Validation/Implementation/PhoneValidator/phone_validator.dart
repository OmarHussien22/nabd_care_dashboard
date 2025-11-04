import '../../Abstract/validator_imp.dart';
import '../../validation_constants.dart';

class PhoneValidator extends ValidatorImp {
  PhoneValidator._();
  static PhoneValidator get instance => PhoneValidator._();
  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    if (value!.isEmpty) {
      return ValidationConstants.validatePhone;
    }
    if (value.length < 10) {
      return ValidationConstants.validatePhoneIsShort;
    }
    if (value.contains(RegExp(r'[a-zA-Z]'))) {
      return ValidationConstants.validatePhone;
    }
    // RegExp regex = RegExp(r'^(\+201|01|00201)[0-2,5]{1}[0-9]{8}$');
    // if (!regex.hasMatch(value)) {
    //   return ValidationConstants.validatePhoneContainNumber;
    // }
    return null;
  }
}
//RegExp(r'[a-zA-Z]'))
