import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Roles/domain/use_cases/fetch_roles_use_case.dart';
import 'package:care_desk/src/Features/Users/core/add_user_prams.dart';
import 'package:care_desk/src/Features/Users/domain/entities/auth_entities.dart';
import 'package:care_desk/src/Features/Users/domain/use_cases/add_user_use_case.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetControllerInterface {
  final AddUserUseCase _addUserUseCase = AddUserUseCase();
  final FetchRolesUseCase _fetchRolesUseCase = FetchRolesUseCase();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  
  List<RoleEntity> roles = [];
  RoleEntity? selectedRole;
  bool isLoadingRoles = true;

  @override
  void onInit() {
    super.onInit();
    fetchRoles();
  }

  Future<void> fetchRoles() async {
    isLoadingRoles = true;
    update(['user_form']);
    
    final dataState = await _fetchRolesUseCase.call()!;
    
    if (dataState is DataSuccess) {
      roles = dataState.data ?? [];
      if (roles.isNotEmpty) {
        selectedRole = roles.first;
      }
    }
    
    isLoadingRoles = false;
    update(['user_form']);
  }

  void setSelectedRole(RoleEntity? role) {
    selectedRole = role;
    update(['user_form']);
  }

  Future<void> saveUser() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty || selectedRole == null) {
      Get.snackbar('Error', 'Please fill all required fields');
      return;
    }

    emit(const DataLoading());
    
    final dataState = await _addUserUseCase.call(
      params: AddUserParams(
        name: nameController.text,
        email: emailController.text,
        roleId: selectedRole!.id,
        phone: phoneController.text.isEmpty ? null : phoneController.text,
      ),
    )!;

    if (dataState is DataSuccess) {
      Get.back();
      Get.snackbar('Success', 'User account created successfully');
    } else if (dataState is DataFailed) {
      emit(dataState);
      Get.snackbar('Error', dataState.error?.title ?? 'Failed to create user');
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
