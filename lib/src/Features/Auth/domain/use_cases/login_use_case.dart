import 'package:care_desk/src/Shared/Models/user_model.dart';


import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
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
