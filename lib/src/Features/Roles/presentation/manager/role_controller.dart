import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Users/domain/entities/auth_entities.dart';
import 'package:care_desk/src/Features/Roles/domain/use_cases/fetch_permissions_use_case.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:flutter/material.dart';

class RoleController extends GetControllerInterface {
  final FetchPermissionsUseCase _fetchPermissionsUseCase = FetchPermissionsUseCase();

  final TextEditingController nameController = TextEditingController();
  List<PermissionEntity> allPermissions = [];
  Set<String> selectedPermissionIds = {};
  
  bool isLoadingPermissions = true;

  @override
  void onInit() {
    super.onInit();
    fetchPermissions();
  }

  Future<void> fetchPermissions() async {
    isLoadingPermissions = true;
    update(['role_form']);
    
    final dataState = await _fetchPermissionsUseCase.call()!;
    
    if (dataState is DataSuccess) {
      allPermissions = dataState.data ?? [];
    }
    
    isLoadingPermissions = false;
    update(['role_form']);
  }

  void togglePermission(String id) {
    if (selectedPermissionIds.contains(id)) {
      selectedPermissionIds.remove(id);
    } else {
      selectedPermissionIds.add(id);
    }
    update(['role_form']);
  }

  bool isPermissionSelected(String id) => selectedPermissionIds.contains(id);

  Map<String, List<PermissionEntity>> get groupedPermissions {
    final Map<String, List<PermissionEntity>> grouped = {};
    for (var p in allPermissions) {
      if (!grouped.containsKey(p.category)) {
        grouped[p.category] = [];
      }
      grouped[p.category]!.add(p);
    }
    return grouped;
  }

  Future<void> saveRole() async {
    // Implement save logic here
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
