import '../../../Extensions/duration_extension.dart';
import '../../Abstract/validator_imp.dart';
import '../../validation_constants.dart';

class ToTimeValidator extends ValidatorImp {
  ToTimeValidator._();

  static ToTimeValidator get instance => ToTimeValidator._();

  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    final DateTime? fromTime = argument?['from_time'] ?? DateTime.now();
    if (value!.isNotEmpty) {
      if ((DateTime.tryParse(value).noneNull).isBefore(fromTime.noneNull)) {
        return ValidationConstants.validateToTimeToFromTime;
      } else if ((DateTime.tryParse(value).noneNull).isBefore(DateTime.now())) {
        return ValidationConstants.validateToTimeToNow;
      } else {
        return null;
      }
    } else {
      return ValidationConstants.validateToTime;
    }
  }
}
