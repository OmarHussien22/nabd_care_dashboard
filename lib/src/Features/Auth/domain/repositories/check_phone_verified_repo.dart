import 'package:care_desk/src/Shared/Models/user_model.dart';


import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
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
