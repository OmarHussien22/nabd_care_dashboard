import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:getx_base_code/src/Features/LocalAuth/data/data_sources/get_roles_local_service.dart';
import 'package:getx_base_code/src/Features/LocalAuth/domain/entities/roles_entity.dart';

class GetRolesLocalRepo extends LocalRepoInterface<List<RolesModel>> {
  GetRolesLocalRepo._();
  static final instance = GetRolesLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      GetRolesLocalService.instance;

  @override
  ResponseType get responseType => ResponseType.withData;

  @override
  List<RolesModel> Function(dynamic data) get onParse => (data) {
        return List.from(data).map((e) => RolesModel.fromJson(e)).toList();
      };
}
