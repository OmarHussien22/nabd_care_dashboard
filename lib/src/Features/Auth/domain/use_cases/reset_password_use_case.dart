import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Shared/Models/user_model.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../../core/params/reset_password_params.dart';
import '../repositories/reset_password_repository.dart';

class ResetPasswordUseCase extends UseCase<UserModel, ResetPasswordParams> {
  @override
  Future<DataState<UserModel>>? call({ResetPasswordParams? params}) {
    return ResetPasswordRepository.instance.call(params: params);
  }
}
