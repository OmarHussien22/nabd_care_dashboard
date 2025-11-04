import '../../Abstract/validator_imp.dart';

class UrlValidator extends ValidatorImp {
  UrlValidator._();

  static UrlValidator get instance => UrlValidator._();

  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    if (value?.isEmpty ?? true) {
      return 'Please enter a URL';
    }
    if (!(value ?? '').contains('http')) {
      return 'Please enter a valid URL';
    }
    return null;
  }
}
