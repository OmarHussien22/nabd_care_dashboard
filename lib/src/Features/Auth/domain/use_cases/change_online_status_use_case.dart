import 'package:getx_base_code/src/Features/Auth/core/params/cahnge_online_status_params.dart';
import 'package:getx_base_code/src/Features/Auth/domain/repositories/change_online_status_repository.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';

class ChangeOnlineStatusUseCase
    extends UseCase<void, ChangeOnlineStatusParams> {
  @override
  Future<DataState<void>>? call({ChangeOnlineStatusParams? params}) {
    return ChangeOnlineStatusRepository.instance.call(
      params: params,
    );
  }
}
