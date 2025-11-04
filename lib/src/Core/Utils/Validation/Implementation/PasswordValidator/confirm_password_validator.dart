import '../../Abstract/validator_imp.dart';
import '../../validation_constants.dart';

class ConfirmPasswordValidator extends ValidatorImp {
  ConfirmPasswordValidator._();
  static ConfirmPasswordValidator get instance => ConfirmPasswordValidator._();
  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    final password = argument?['password'] ?? '';
    if (value!.isEmpty) {
      return ValidationConstants.emptyData;
    } else {
      if (value != password) {
        return ValidationConstants.validatePasswordConfirm;
      } else {
        return null;
      }
    }
  }
}
