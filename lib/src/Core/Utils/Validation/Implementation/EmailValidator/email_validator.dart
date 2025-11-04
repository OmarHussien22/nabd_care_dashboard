import '../../Abstract/validator_imp.dart';
import '../../validation_constants.dart';

class EmailValidator extends ValidatorImp {

  EmailValidator._();
  static EmailValidator get instance => EmailValidator._();


  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  
    if (value!.isEmpty) {
      return ValidationConstants.emptyData;
    } else if (!emailRegex.hasMatch(value)) {
      return ValidationConstants.invalidEmail;
    }
    return null;
  }
}
