import 'package:getx_base_code/src/Shared/Models/user_model.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/check_verification_code_api_service.dart';

class CheckVerificationCodeRepository extends RepoInterface<UserModel> {
  CheckVerificationCodeRepository._();

  static final instance = CheckVerificationCodeRepository._();

  @override
  ServicesInterface get serviceInstance =>
      CheckVerificationCodeApiService.instance;
  @override
  UserModel Function(dynamic data) get onParse => (data) {
        return UserModel.fromJson(data);
      };
}
