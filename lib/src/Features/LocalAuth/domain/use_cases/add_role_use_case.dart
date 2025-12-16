import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/repositories/add_roles_repo.dart';
import 'package:care_desk/src/Features/LocalAuth/roles_params.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';

class AddRoleUseCase extends UseCase<bool, RolesParams> {
  @override
  Future<DataState<bool>> call({RolesParams? params}) async {
    return await AddRolesRepo.instance.call(params: params)!;
  }
}
