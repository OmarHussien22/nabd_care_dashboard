import 'package:getx_base_code/src/Core/params/local_params.dart';

class RegisterUserParams extends LocalParams {
  String password;
  String name;
  String email;
  String phone;
  int roleId;
  bool isActive;

  RegisterUserParams({
    required this.password,
    required this.name,
    required this.email,
    required this.phone,
    required this.roleId,
    this.isActive = true,
  });

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone, // ✅ تمت إضافة phone هنا
        'password': password, // هنشفرها لاحقًا
        'role_id': roleId,
        'is_active': isActive ? 1 : 0,
      };
}
