import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/check_phone_verified_service.dart';

class CheckPhoneVerifiedRepo extends RepoInterface<UserModel> {
  CheckPhoneVerifiedRepo._();

  static final instance = CheckPhoneVerifiedRepo._();

  @override
  ServicesInterface get serviceInstance => CheckPhoneVerifiedService.instance;

  @override
  UserModel Function(dynamic data) get onParse => (data) {
        return UserModel.fromJson(data);
      };
}
