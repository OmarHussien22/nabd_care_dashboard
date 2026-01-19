import 'package:care_desk/src/Features/Auth/core/params/send_request_device_params.dart';
import 'package:care_desk/src/Features/Auth/domain/repositories/send_request_device_repo.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';

class SendRequestDeviceUseCase extends UseCase<void, SendRequestDeviceParams> {
  @override
  Future<DataState<void>>? call({SendRequestDeviceParams? params}) {
    return SendRequestDeviceRepository.instance.call(params: params);
  }
}
