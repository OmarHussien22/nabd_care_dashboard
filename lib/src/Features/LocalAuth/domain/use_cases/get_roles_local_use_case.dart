import 'package:getx_base_code/src/Core/LocalDataBaseStructure/useCase/local_use_case_interface.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Features/LocalAuth/domain/entities/roles_entity.dart';
import 'package:getx_base_code/src/Features/LocalAuth/domain/repositories/get_roles_local_repo.dart';

class GetRolesLocalUseCase extends LocalUseCase<List<RolesModel>, void> {
  @override
  Future<DataState<List<RolesModel>>>? call({void params}) {
    return GetRolesLocalRepo.instance.call();
  }
}
