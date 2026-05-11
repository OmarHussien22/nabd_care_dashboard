import 'package:care_desk/src/Core/Utils/Extensions/json_parsing_extension.dart';
import '../../../Users/domain/entities/auth_entities.dart';
import 'permission_model.dart';

class RoleModel extends RoleEntity {
  const RoleModel({
    required super.id,
    required super.name,
    required super.permissions,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json.parseString('id') ?? '',
      name: json.parseString('name') ?? '',
      permissions: (json['permissions'] as List? ?? [])
          .map((e) => PermissionModel.fromJson(e))
          .toList(),
    );
  }
}
