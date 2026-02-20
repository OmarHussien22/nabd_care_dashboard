import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Shared/Models/user_model.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
import '../../core/params/reset_password_params.dart';
import '../repositories/reset_password_repository.dart';

class ResetPasswordUseCase extends UseCase<UserModel, ResetPasswordParams> {
  @override
  Future<DataState<UserModel>>? call({ResetPasswordParams? params}) {
    return ResetPasswordRepository.instance.call(params: params);
  }
}
