import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Shared/Models/user_model.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../../core/params/send_verification_code_params.dart';
import '../repositories/send_verification_code_repository.dart';

class SendVerificationCodeUseCase
    extends UseCase<UserModel, SendVerificationCodeParams> {
  @override
  Future<DataState<UserModel>>? call({SendVerificationCodeParams? params}) {
    return SendVerificationCodeRepository.instance.call(
      params: params,
    );
  }
}
