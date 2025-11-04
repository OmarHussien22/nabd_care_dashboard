import '../../../../Shared/Models/user_model.dart';
import '../../core/params/set_user_info_params.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../repositories/set_user_info_repository.dart';

class SetUserInfoUseCase extends UseCase<UserModel, SetUserInfoParams> {
  @override
  Future<DataState<UserModel>>? call({SetUserInfoParams? params}) {
    return SetUserInfoRepository.instance.call(
      params: params,
    );
  }
}
