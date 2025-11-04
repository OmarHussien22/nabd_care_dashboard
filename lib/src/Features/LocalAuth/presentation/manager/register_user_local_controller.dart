import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_code/src/Features/Auth/presentation/pages/imports_auth.dart';
import 'package:getx_base_code/src/Features/LocalAuth/domain/use_cases/register_user_local_use_case.dart';
import 'package:getx_base_code/src/Features/LocalAuth/presentation/manager/get_roles_local_controller.dart';
import 'package:getx_base_code/src/Features/LocalAuth/register_user_params.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Core/Utils/general_utils.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';

class RegisterUserLocalController extends GetControllerInterface<int> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController email;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final GetRolesLocalController getRolesLocalController =
      Get.put(GetRolesLocalController());
  Future<void> register() async {
    final RegisterUserLocalUseCase useCase = RegisterUserLocalUseCase();

    state = await useCase.call(
        params: RegisterUserParams(
      phone: phoneController.text,
      email: email.text,
      roleId: getRolesLocalController.roleId,
      password: passwordController.text,
      name: nameController.text,
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
    // if (state is DataSuccess) {
    //   final RegisterUserParams newUser = RegisterUserParams(
    //     phone: phoneController.text,
    //     email: email.text,
    //     roleId: getRolesLocalController.roleId,
    //     password: passwordController.text,
    //     name: nameController.text,
    //     isActive: true,
    //   );
    // // إذا كانت البيانات سليمة، نقوم بإدخال المستخدم الجديد في قاعدة البيانات
    // final insertState = await GetDataBaseMethod.instance.fetch(
    //   tableName:
    //       TablesNames.usersTable, // اسم الجدول الذي سيتم إدخال البيانات فيه
    //
    //   whereArgs: newUser,
    // );
    //   if (insertState is DataSuccess) {
    //     if (insertState.data != null) {
    //       UserLocalController.get.updateUser(insertState.data!);
    //       ClientSnacks.registerSuccess();
    //       Get.offAll(() => HomePage());
    //     }
    //   } else if (insertState is DataFailed) {
    //     printDM("error is=> ${insertState.statusMessage}");
    //     ClientSnacks.requestError(error: insertState.statusMessage);
    //   }
    // } else if (state is DataFailed) {
    //   printDM("error is=> ${state.statusMessage}");
    //   ClientSnacks.requestError(error: state.statusMessage);
    // }
  }

  bool _isButtonDisabled = false;
  bool get isButtonDisabled => _isButtonDisabled;

  void _changeButtonState() {
    if (phoneController.text.isNotEmpty &&
        email.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty) {
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
    email = TextEditingController();
    phoneController.addListener(_changeButtonState);
    passwordController.addListener(_changeButtonState);
    nameController.addListener(_changeButtonState);
    email.addListener(_changeButtonState);
  }
}
