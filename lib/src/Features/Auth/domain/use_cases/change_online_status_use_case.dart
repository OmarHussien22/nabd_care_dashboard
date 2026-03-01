import 'package:care_desk/src/Core/network_structure/networking/src/utils/upload_option.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Auth/core/params/cahnge_online_status_params.dart';
import 'package:care_desk/src/Features/Auth/domain/repositories/change_online_status_repository.dart';

import 'package:care_desk/src/Super/UseCase/user_case.dart';

class ChangeOnlineStatusUseCase
    extends UseCase<void, ChangeOnlineStatusParams> {
  @override
  Future<DataState<void>>? call({ChangeOnlineStatusParams? params}) {
    return ChangeOnlineStatusRepository.instance.call(
      params: params,
    );
  }
}
