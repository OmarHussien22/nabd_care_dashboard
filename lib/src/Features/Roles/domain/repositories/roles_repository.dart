import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import 'package:care_desk/src/Features/Users/domain/entities/auth_entities.dart';
import '../../data/data_sources/roles_api_service.dart';
import '../../data/models/role_model.dart';

class RolesRepository extends RepoInterface<List<RoleEntity>> {
  RolesRepository._();
  static final instance = RolesRepository._();

  @override
  ServicesInterface get serviceInstance => RolesApiService.instance;

  @override
  List<RoleEntity> Function(dynamic data) get onParse => (data) {
        return (data as List? ?? [])
            .map((e) => RoleModel.fromJson(e))
            .toList();
      };

  @override
  List<RoleEntity>? get devData => [
        RoleEntity(
          id: '1',
          name: 'Administrator',
          permissions: [PermissionEntity.devPermission],
        ),
        const RoleEntity(
          id: '2',
          name: 'Doctor',
          permissions: [],
        ),
        const RoleEntity(
          id: '3',
          name: 'Receptionist',
          permissions: [],
        ),
      ];
}
