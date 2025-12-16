import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:care_desk/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:care_desk/src/Features/LocalAuth/data/data_sources/add_roles_local_service.dart';

class AddRolesRepo extends LocalRepoInterface<bool> {
  AddRolesRepo._();
  static final instance = AddRolesRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      AddRolesLocalService.instance;
  @override
  ResponseType get responseType => ResponseType.withoutData;
  @override
  bool Function(dynamic data) get onParse => (data) => true;
}
