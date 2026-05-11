import 'package:equatable/equatable.dart';

class PermissionEntity extends Equatable {
  final String id;
  final String name;
  final String category;

  const PermissionEntity({
    required this.id,
    required this.name,
    required this.category,
  });

  @override
  List<Object?> get props => [id, name, category];

    static PermissionEntity get devPermission => const PermissionEntity(
        id: '1',
        name: 'Admin',
        category: 'Admin',
      );
}

class RoleEntity extends Equatable {
  final String id;
  final String name;
  final List<PermissionEntity> permissions;

  const RoleEntity({
    required this.id,
    required this.name,
    required this.permissions,
  });

  @override
  List<Object?> get props => [id, name, permissions];

    static RoleEntity get devRole =>  RoleEntity(
        id: '1',
        name: 'Admin',
        permissions: [PermissionEntity.devPermission],
      );
}
