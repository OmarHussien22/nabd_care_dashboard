import 'package:getx_base_code/src/Shared/Models/user_model.dart';


import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../../core/params/login_params.dart';
import '../repositories/login_repository.dart';

class LoginUseCase extends UseCase<UserModel, LoginParams> {
  @override
  Future<DataState<UserModel>>? call({LoginParams? params}) {
    return LoginRepository.instance.call(
      params: params,
    );
  }
}
