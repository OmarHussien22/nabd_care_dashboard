import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:care_desk/src/Features/LocalAuth/data/models/local_user_model.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/repositories/login_user_local_repo.dart';
import 'package:care_desk/src/Features/LocalAuth/login_user_params.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';

class LoginUserLocalUseCase extends UseCase<LocalUserModel, LoginUserParams> {
  @override
  Future<DataState<LocalUserModel>> call({LoginUserParams? params}) async {
    return await LoginUserLocalRepo.instance.call(params: params)!;
  }
}
