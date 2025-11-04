import '../../Abstract/validator_imp.dart';
import '../../validation_constants.dart';

class PasswordValidator extends ValidatorImp {
  PasswordValidator._();
  static PasswordValidator get instance => PasswordValidator._();
  @override
  String? validate(String? value, [Map<String, dynamic>? argument]) {
    if (value!.isEmpty) {
      return ValidationConstants.validatePassword;
    } else {
      if (value.length < 8) {
        return ValidationConstants.validatePasswordLength;
      } else {
        return null;
      }
    }
  }
}

// SuffixImp suffixCheckPhone(String value) {
//   //update();
//   if (AppValidator.phoneValidator.validate(value) == null) {
//     return SuffixWithIconImage(
//       iconImage: AppIcons.checkCircle,
//       color: AppColors.get.green,
//     );
//   } else {
//     return SuffixWithIconData(
//       iconData: Icons.highlight_remove,
//       color: AppColors.get.red,
//       size: 15,
//     );
//   }
// }
