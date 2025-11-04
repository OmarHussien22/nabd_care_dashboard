import '../../Abstract/validator_imp.dart';

class NoneValidator extends ValidatorImp {
  NoneValidator._();

  static NoneValidator get instance => NoneValidator._();

  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    return null;
  }
}
