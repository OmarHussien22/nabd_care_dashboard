import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:care_desk/src/Features/LocalAuth/domain/use_cases/register_user_local_use_case.dart';
import 'package:care_desk/src/Features/LocalAuth/presentation/manager/get_roles_local_controller.dart';
import 'package:care_desk/src/Features/LocalAuth/register_user_params.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Core/Utils/general_utils.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';

class RegisterUserLocalController extends GetControllerInterface<int> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController clinicNameController;
  late TextEditingController
      emailController; // Renamed from 'email' to 'emailController'
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final GetRolesLocalController getRolesLocalController =
      Get.put(GetRolesLocalController());
  Future<void> register() async {
    final RegisterUserLocalUseCase useCase = RegisterUserLocalUseCase();

    state = await useCase.call(
        params: RegisterUserParams(
      phone: phoneController.text,
      email: emailController.text, // Using emailController.text
      roleId: getRolesLocalController.roleId,
      password: passwordController.text,
      name: nameController.text,
      clinicName: clinicNameController.text,
      isActive: true,
    ));
    emit(state);
    printDM("data is ${state.data}");
    if (state is DataSuccess) {
      // UserLocalController.get.updateUser(state.data!);
      ClientSnacks.registerSuccess();
      Get.offAll(() => LoginPage());
    } else {
      printDM("error when insert");
      ClientSnacks.requestError(error: state.message ?? "");
    }
  }

  bool _isButtonDisabled = false;
  bool get isButtonDisabled => _isButtonDisabled;

  void _changeButtonState() {
    if (phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty && // Using emailController.text
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        clinicNameController.text.isNotEmpty) {
      _isButtonDisabled = false;
    } else {
      _isButtonDisabled = true;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    clinicNameController = TextEditingController();
    emailController = TextEditingController(); // Initialized emailController
  }
}
