import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
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
