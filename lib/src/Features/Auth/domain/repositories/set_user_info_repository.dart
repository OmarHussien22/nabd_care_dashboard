import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/set_user_info_api_service.dart';

class SetUserInfoRepository extends RepoInterface<UserModel> {
  SetUserInfoRepository._();

  static final instance = SetUserInfoRepository._();

  @override
  ServicesInterface get serviceInstance => SetUserInfoApiService.instance;

  @override
  UserModel Function(dynamic data) get onParse => (data) {
        return UserModel.fromJson(data);
      };
}
