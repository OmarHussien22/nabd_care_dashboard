import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/LocalAuth/domain/repositories/register_user_local_repo.dart';
import 'package:getx_base_code/src/Features/LocalAuth/register_user_params.dart';
import 'package:getx_base_code/src/Super/UseCase/user_case.dart';

class RegisterUserLocalUseCase extends UseCase<int, RegisterUserParams> {
  @override
  Future<DataState<int>> call({RegisterUserParams? params}) async {
    return await RegisterUserLocalRepo.instance.call(params: params)!;
  }
}
