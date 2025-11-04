import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../../core/params/change_password_params.dart';
import '../repositories/change_password_repository.dart';

class ChangePasswordUseCase extends UseCase<bool, ChangePasswordParams> {
  @override
  Future<DataState<bool>>? call({ChangePasswordParams? params}) {
    return ChangePasswordRepository.instance.call(
      params: params,
    );
  }
}
