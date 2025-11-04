import 'package:flutter/cupertino.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/LocalAuth/domain/entities/roles_entity.dart';
import 'package:getx_base_code/src/Features/LocalAuth/domain/use_cases/get_roles_local_use_case.dart';
import 'package:getx_base_code/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class GetRolesLocalController extends GetControllerInterface<List<RolesModel>> {
  // List<RolesModel> rolesUser = [];

  late TextEditingController roleController;
  int roleId = 0;
  void selectRoleId(RolesModel role) {
    roleController.text = role.role;
    roleId = role.id;
    update();
  }

  Future<void>fetchUserRoles() async {
    emit(const DataLoading());
    // final state = await GetDataBaseMethod.instance.fetch(
    //   tableName: TablesNames.rolesUsersTable,
    // );
    final GetRolesLocalUseCase useCase = GetRolesLocalUseCase();
    final state = await useCase.call()!;
    printDM("roles User ${state.data}");
    if (state is DataSuccess) {
      //rolesUser = state.data!;
      printDM("Omar success ${state.data}");
    } else if (state is DataFailed) {
      printDM("Omar failed ${state.error!.title}");
      // printDM("Omar failed ${state.message}");
    }
    emit(state);
  }

  // Future<void> removeRole({required int roleId}) async {
  //   emit(const DataLoading());
  //   final user = await DeleteDataBaseMethod.instance.delete(
  //     table: TablesNames.rolesUsersTable,
  //     where: "id = ?",
  //     whereArgs: [roleId],
  //     showLoading: true,
  //   );
  //   if (state is DataSuccess) {
  //     state.data!.removeWhere((role) => role.id == roleId);
  //     fetchUserRoles();
  //     // emit(DataSuccess(rolesUser));
  //   } else if (state is DataFailed) {
  //     emit(DataFailed(state.error!));
  //   }
  //   emit(state);
  //   //update();
  //   //emit(DataSuccess(rolesUser));
  // }

  @override
  void onInit() {
     super.onInit();
    roleController = TextEditingController();
   fetchUserRoles();
   
  }
}
