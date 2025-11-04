import 'package:getx_base_code/src/Shared/Models/user_model.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../../core/params/check_verification_code_params.dart';
import '../repositories/check_verification_code_repository.dart';

class CheckVerificationCodeUseCase
    extends UseCase<UserModel, CheckVerificationCodeParams> {
  @override
  Future<DataState<UserModel>>? call({CheckVerificationCodeParams? params}) {
    return CheckVerificationCodeRepository.instance.call(
      params: params,
    );
  }
}
