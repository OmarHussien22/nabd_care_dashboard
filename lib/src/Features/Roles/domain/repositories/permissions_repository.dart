import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import 'package:care_desk/src/Features/Roles/data/data_sources/roles_api_service.dart';
import 'package:care_desk/src/Features/Roles/data/models/permission_model.dart';
import 'package:care_desk/src/Features/Users/domain/entities/auth_entities.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';
import 'package:dio/dio.dart';

class PermissionsRepository extends RepoInterface<List<PermissionEntity>> {
  PermissionsRepository._();
  static final instance = PermissionsRepository._();

  @override
  ServicesInterface get serviceInstance => PermissionApiService.instance;

  @override
  List<PermissionEntity> Function(dynamic data) get onParse => (data) {
        return (data as List? ?? [])
            .map((e) => PermissionModel.fromJson(e))
            .toList();
      };

  @override
  List<PermissionEntity>? get devData => [
        const PermissionEntity(id: '1', name: 'View Patients', category: 'Patients'),
        const PermissionEntity(id: '2', name: 'Create Patient', category: 'Patients'),
        const PermissionEntity(id: '3', name: 'Edit Patient', category: 'Patients'),
        const PermissionEntity(id: '4', name: 'Delete Patient', category: 'Patients'),
        const PermissionEntity(id: '5', name: 'View Appointments', category: 'Appointments'),
        const PermissionEntity(id: '6', name: 'Create Appointment', category: 'Appointments'),
        const PermissionEntity(id: '7', name: 'View Invoices', category: 'Billing'),
        const PermissionEntity(id: '8', name: 'Edit Invoices', category: 'Billing'),
      ];
}

class PermissionApiService extends ServicesInterface {
  PermissionApiService._();
  static final instance = PermissionApiService._();

  @override
  Future<Response> applyService({Params? params}) async {
    return await RolesApiService.instance.fetchPermissions();
  }
}
