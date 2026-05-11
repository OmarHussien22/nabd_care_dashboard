import 'package:care_desk/src/Core/Utils/Extensions/json_parsing_extension.dart';
import '../../../Users/domain/entities/auth_entities.dart';

class PermissionModel extends PermissionEntity {
  const PermissionModel({
    required super.id,
    required super.name,
    required super.category,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) {
    return PermissionModel(
      id: json.parseString('id') ?? '',
      name: json.parseString('name') ?? '',
      category: json.parseString('category') ?? 'General',
    );
  }
}
