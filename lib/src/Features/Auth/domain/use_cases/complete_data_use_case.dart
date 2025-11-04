import 'package:getx_base_code/src/Shared/Models/user_model.dart';

import '../repositories/complete_data_repository.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../../core/params/complete_data_params.dart';

class CompleteDataUseCase extends UseCase<UserModel, CompleteDataParams> {
  @override
  Future<DataState<UserModel>>? call({CompleteDataParams? params}) {
    return CompleteDataRepository.instance. call(
      params: params,
    );
  }
}
