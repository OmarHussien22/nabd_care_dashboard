import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Users/domain/entities/auth_entities.dart';
import 'package:care_desk/src/Features/Roles/domain/use_cases/fetch_roles_use_case.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class RolesListController extends GetControllerInterface<List<RoleEntity>> {
  final FetchRolesUseCase _fetchRolesUseCase = FetchRolesUseCase();

  List<RoleEntity> roles = [];

  @override
  void onInit() {
    super.onInit();
    fetchRoles();
  }

  Future<void> fetchRoles() async {
    emit(const DataLoading());
    
    final dataState = await _fetchRolesUseCase.call()!;

    if (dataState is DataSuccess) {
      roles = dataState.data ?? [];
      emit(dataState);
    } else if (dataState is DataFailed) {
      emit(dataState);
    }
    
    update(['roles_list']);
  }
}
