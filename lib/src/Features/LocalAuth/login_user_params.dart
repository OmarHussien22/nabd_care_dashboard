import 'package:care_desk/src/Core/params/local_params.dart';

class LoginUserParams extends LocalParams {
  final String emailOrPhone;
  final String password;

  LoginUserParams({required this.emailOrPhone, required this.password});

  @override
  Map<String, dynamic> toJson() {
    return {
      "username":
          emailOrPhone, // Generic key 'username' usually maps to email or phone in backend/logic
      "password": password,
    };
  }
}
