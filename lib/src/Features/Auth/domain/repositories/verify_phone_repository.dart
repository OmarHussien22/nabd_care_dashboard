import 'package:care_desk/src/Shared/Models/user_model.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import '../../data/data_sources/verify_phone_api_service.dart';

class VerifyPhoneRepository extends RepoInterface<UserModel> {
  VerifyPhoneRepository._();

  static final instance = VerifyPhoneRepository._();

  @override
  ServicesInterface get serviceInstance => VerifyPhoneApiService.instance;

  @override
  UserModel Function(dynamic data) get onParse => (data) {
        return UserModel.fromJson(
          data,
        );
      };
}
