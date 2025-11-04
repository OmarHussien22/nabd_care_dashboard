import '../../Abstract/validator_imp.dart';
import '../../../general_utils.dart';

class NoOfReceiversValidator extends ValidatorImp {
  NoOfReceiversValidator._();

  static NoOfReceiversValidator get instance => NoOfReceiversValidator._();

  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    final groupMembersCount = argument?['members_count'] ?? -1;
    final valueAsNum = int.tryParse(value?.replaceAll(
          RegExp(r'[^0-9]'),
          '',
        ) ??
        '');
    printDM("++groupMembersCount: $groupMembersCount - $valueAsNum - $value");
    if (value == null || value.isEmpty) {
      return 'Number of receivers must not be empty';
    }
    if (valueAsNum == null) {
      return 'Please enter valid number of receivers';
    }
    if (valueAsNum < 1) {
      return 'Number of receivers can not be less than 1';
    }
    if (valueAsNum > groupMembersCount) {
      return 'Receivers can\'t be more than : $groupMembersCount';
    }
    return null;
  }
}
