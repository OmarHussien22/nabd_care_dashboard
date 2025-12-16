import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/repositories/register_user_local_repo.dart';
import 'package:care_desk/src/Features/LocalAuth/register_user_params.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';

class RegisterUserLocalUseCase extends UseCase<int, RegisterUserParams> {
  @override
  Future<DataState<int>> call({RegisterUserParams? params}) async {
    return await RegisterUserLocalRepo.instance.call(params: params)!;
  }
}
