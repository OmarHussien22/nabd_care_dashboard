import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Users/domain/entities/auth_entities.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
import '../repositories/permissions_repository.dart';

class FetchPermissionsUseCase extends UseCase<List<PermissionEntity>, void> {
  @override
  Future<DataState<List<PermissionEntity>>>? call({void params}) {
    return PermissionsRepository.instance.call();
  }
}
