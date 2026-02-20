import 'package:care_desk/src/Shared/Models/user_model.dart';

import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
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
