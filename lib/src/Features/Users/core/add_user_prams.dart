import 'package:care_desk/src/Core/network_structure/params/params.dart';

class AddUserParams extends Params {
  final String name;
  final String email;
  final String roleId;
  final String? phone;

  AddUserParams({
    required this.name,
    required this.email,
    required this.roleId,
    this.phone,
  });

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'role_id': roleId,
        if (phone != null) 'phone': phone,
      };
}