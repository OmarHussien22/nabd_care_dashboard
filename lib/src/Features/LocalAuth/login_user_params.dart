import 'package:getx_base_code/src/Core/params/local_params.dart';

class LoginUserParams extends LocalParams {
  final String phone;
  final String password;

  LoginUserParams({required this.phone, required this.password});

  @override
  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "password": password,
    };
  }
}
