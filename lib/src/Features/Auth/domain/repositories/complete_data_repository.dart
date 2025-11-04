import 'package:getx_base_code/src/Shared/Models/user_model.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/complete_data_api_service.dart';

class CompleteDataRepository extends RepoInterface<UserModel> {
  CompleteDataRepository._();

  static final instance = CompleteDataRepository._();

  @override
  ServicesInterface get serviceInstance => CompleteDataApiService.instance;

  @override
  UserModel Function(dynamic data) get onParse => (data) {
        return UserModel.fromJson(data);
      };
}
