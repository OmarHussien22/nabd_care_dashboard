import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localDataSource/interfaces/data_base_service_interface.dart';
import 'package:getx_base_code/src/Core/LocalDataBaseStructure/localRepository/local_repository_interface.dart';
import 'package:getx_base_code/src/Features/LocalAuth/data/data_sources/login_user_local_service.dart';
import 'package:getx_base_code/src/Features/LocalAuth/data/models/local_user_model.dart';

class LoginUserLocalRepo extends LocalRepoInterface<LocalUserModel> {
  LoginUserLocalRepo._();
  static final instance = LoginUserLocalRepo._();

  @override
  DataBaseServiceInterface get databaseServiceInstance =>
      LoginUserLocalService.instance;

  // @override
  // ResponseType get responseType => ResponseType.withoutData;

  @override
  LocalUserModel Function(dynamic data) get onParse => (data) {
        return LocalUserModel.fromJson(data);
      };
}
