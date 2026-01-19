import 'package:care_desk/src/Shared/Models/user_model.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../repositories/check_phone_verified_repo.dart';

class CheckPhoneVerifiedUseCase extends UseCase<UserModel, void> {
  @override
  Future<DataState<UserModel>>? call({void params}) {
    return CheckPhoneVerifiedRepo.instance.call();
  }
}
