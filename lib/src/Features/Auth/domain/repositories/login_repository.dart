import 'package:care_desk/src/Shared/Models/user_model.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
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
