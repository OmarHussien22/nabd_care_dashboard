import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/login_api_service.dart';

class LoginRepository extends RepoInterface<UserModel> {
  LoginRepository._();

  static final instance = LoginRepository._();

  @override
  ServicesInterface get serviceInstance => LoginApiService.instance;

  @override
  UserModel Function(dynamic data) get onParse => (data) {
        return UserModel.fromJson(data);
      };
}
