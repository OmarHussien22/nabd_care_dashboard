import 'package:care_desk/src/Core/params/local_params.dart';

class RegisterUserParams extends LocalParams {
  String password;
  String name;
  String email;
  String phone;
  int roleId;
  bool isActive;

  String clinicName;

  RegisterUserParams({
    required this.password,
    required this.name,
    required this.email,
    required this.phone,
    required this.roleId,
    required this.clinicName,
    this.isActive = true,
  });

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'role_id': roleId,
        'is_active': isActive ? 1 : 0,
        // clinicName is NOT part of user table, handled separately in UseCase
      };
}
