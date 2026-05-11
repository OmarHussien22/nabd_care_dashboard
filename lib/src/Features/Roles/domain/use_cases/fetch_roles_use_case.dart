import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Users/domain/entities/auth_entities.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
import '../repositories/roles_repository.dart';

class FetchRolesUseCase extends UseCase<List<RoleEntity>, void> {
  @override
  Future<DataState<List<RoleEntity>>>? call({void params}) {
    return RolesRepository.instance.call();
  }
}
