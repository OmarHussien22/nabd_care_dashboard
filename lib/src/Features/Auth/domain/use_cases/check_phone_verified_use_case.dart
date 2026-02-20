import 'package:care_desk/src/Shared/Models/user_model.dart';

import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
import '../repositories/check_phone_verified_repo.dart';

class CheckPhoneVerifiedUseCase extends UseCase<UserModel, void> {
  @override
  Future<DataState<UserModel>>? call({void params}) {
    return CheckPhoneVerifiedRepo.instance.call();
  }
}
