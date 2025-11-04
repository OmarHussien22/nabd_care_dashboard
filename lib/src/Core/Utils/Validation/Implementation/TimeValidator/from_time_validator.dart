import '../../../Extensions/duration_extension.dart';
import '../../Abstract/validator_imp.dart';
import '../../validation_constants.dart';

class FromTimeValidator extends ValidatorImp {
  FromTimeValidator._();

  static FromTimeValidator get instance => FromTimeValidator._();

  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    if (value!.isNotEmpty) {
      if ((DateTime.tryParse(value).noneNull).isBefore(DateTime.now())) {
        return ValidationConstants.validateFromTimeToNow;
      } else {
        return null;
      }
    } else {
      return ValidationConstants.validateFromTime;
    }
  }
}
