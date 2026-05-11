import 'package:equatable/equatable.dart';
import 'auth_entities.dart';

class UserEntity extends Equatable {
   int id;
   String name;
   String email;
   String? avatar;
   List<RoleEntity> roles;
   List<PermissionEntity> permissions;
   String apiToken;
   int userTypeId;

   UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.roles = const [],
    this.permissions = const [],
    required this.apiToken,
     required this.userTypeId,
  });

  @override
  List<Object?> get props => [id, name, email, avatar, roles, permissions, apiToken, userTypeId];
}
