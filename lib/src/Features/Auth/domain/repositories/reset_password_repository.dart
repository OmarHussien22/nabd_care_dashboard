import 'package:care_desk/src/Shared/Models/user_model.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import '../../data/data_sources/reset_password_api_service.dart';

class ResetPasswordRepository extends RepoInterface<UserModel> {
  ResetPasswordRepository._();

  static final instance = ResetPasswordRepository._();

  @override
  ServicesInterface get serviceInstance => ResetPasswordApiService.instance;
  @override
  UserModel Function(dynamic data) get onParse => (data) {
        return UserModel.fromJson(data);
      };
  @override
  ResponseType get responseType => ResponseType.withData;
}
