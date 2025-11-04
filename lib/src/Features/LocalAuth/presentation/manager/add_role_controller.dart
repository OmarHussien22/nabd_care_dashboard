import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:getx_base_code/src/Core/Utils/general_utils.dart';
import 'package:getx_base_code/src/Features/LocalAuth/domain/use_cases/add_role_use_case.dart';
import 'package:getx_base_code/src/Features/LocalAuth/roles_params.dart';
import 'package:getx_base_code/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import 'package:getx_base_code/src/Super/Controllers/Resources/get/get_controller_interface.dart';

class AddRoleController extends GetControllerInterface<bool> {
  late TextEditingController nameController;

  Future<void> addRoleUser() async {
    emit(const DataLoading());
    final AddRoleUseCase useCase = AddRoleUseCase();
    state = await useCase(
      params: RolesParams(
        name: nameController.text,
      ),
    );
    emit(state);
    if (state is DataSuccess) {
      ClientSnacks.successMessage(message: "Role Added Successfully");
      printDM("Role Added Successfully");
      Get.back();
      ClientSnacks.successMessage(message: state.message);
      // printDM("data ${state.data}");
    } else if (state is DataFailed) {
      // printDM("error add role ${state.error}");
      ClientSnacks.requestError(error: state.error?.title);
    }
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    super.onInit();
  }
}
