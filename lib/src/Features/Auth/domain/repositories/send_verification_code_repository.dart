import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/send_verification_code_api_service.dart';

class SendVerificationCodeRepository extends RepoInterface<UserModel> {
  SendVerificationCodeRepository._();

  static final instance = SendVerificationCodeRepository._();

  @override
  ServicesInterface get serviceInstance =>
      SendVerificationCodeApiService.instance;

  @override
  UserModel Function(dynamic data) get onParse => (data) {
        return UserModel.fromJson(data);
      };
}
