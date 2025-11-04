import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:getx_base_code/src/Features/LocalAuth/data/data_sources/register_user_local_service.dart';

class RegisterUserLocalRepo extends LocalRepoInterface<int> {
  RegisterUserLocalRepo._();
  static final instance = RegisterUserLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      RegisterUserLocalService.instance;

  @override
  // TODO: implement responseType
  ResponseType get responseType => ResponseType.withData;

  @override
  int Function(dynamic data) get onParse => (data) {
        return 1;
      };
}
