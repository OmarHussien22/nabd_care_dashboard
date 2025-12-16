import 'package:care_desk/src/Core/LocalDataBaseStructure/useCase/local_use_case_interface.dart';
import 'package:care_desk/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/entities/roles_entity.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/repositories/get_roles_local_repo.dart';

class GetRolesLocalUseCase extends LocalUseCase<List<RolesModel>, void> {
  @override
  Future<DataState<List<RolesModel>>>? call({void params}) {
    return GetRolesLocalRepo.instance.call();
  }
}
