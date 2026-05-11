import 'package:care_desk/src/Core/network_structure/params/params.dart';

class ChangePasswordParams extends Params {
  String oldPassword;
  String newPassword;

  ChangePasswordParams({required this.oldPassword, required this.newPassword});
  @override
  Map<String, dynamic> toJson() {
    return {
      'old_password': oldPassword,
      'new_password': newPassword,
    };
  }
}
