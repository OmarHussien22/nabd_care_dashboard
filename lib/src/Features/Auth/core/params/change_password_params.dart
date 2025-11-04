
import '../../../../Core/NetworkStructure/Params/params.dart';

class ChangePasswordParams extends Params{
  String oldPassword;
  String newPassword;

  ChangePasswordParams({required this.oldPassword,required this.newPassword});
  @override
  Map<String, dynamic> toJson() {
    return {
      'old_password': oldPassword,
      'new_password': newPassword,
    };
  }
}