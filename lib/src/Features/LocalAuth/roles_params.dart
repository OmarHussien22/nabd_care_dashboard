import 'package:care_desk/src/Core/params/local_params.dart';

class RolesParams extends LocalParams {
  final String name;
  final bool isActive;
  RolesParams({
    required this.name,
    this.isActive = true,
  });
  @override
  Map<String, dynamic> toJson() => {
        'role_name': name,
        'is_active': isActive ? 1 : 0,
      };
}
