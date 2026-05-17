import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';
import 'package:dio/dio.dart';

class RolesApiService extends ServicesInterface {
  RolesApiService._();
  static final instance = RolesApiService._();

  @override
  Future<Response> applyService({Params? params}) async {
    return await call(
      urlFetchRoles,
      type: CrudType.get,
      params: params,
      auth: true,
      withPagination: true,
    );
  }

  

  Future<Response> fetchPermissions() async {
    return await call(
      urlFetchPermissions,
      type: CrudType.get,
      auth: true,
    );
  }

  Future<Response> addRole({Params? params}) async {
    return await call(
      urlAddRole,
      type: CrudType.post,
      params: params,
      auth: true,
    );
  }

  Future<Response> updateRole({Params? params}) async {
    return await call(
      urlUpdateRole,
      type: CrudType.post,
      params: params,
      auth: true,
    );
  }

  Future<Response> deleteRole({Params? params}) async {
    return await call(
      urlDeleteRole,
      type: CrudType.post,
      params: params,
      auth: true,
    );
  }
}
