import '../../Abstract/validator_imp.dart';
import '../../validation_constants.dart';

class DefaultValidator extends ValidatorImp {
  DefaultValidator._();

  static DefaultValidator get instance => DefaultValidator._();

  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return ValidationConstants.emptyData;
    }
  }
}
