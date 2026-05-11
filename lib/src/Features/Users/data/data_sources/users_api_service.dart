import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';
import 'package:dio/dio.dart';

class UsersApiService extends ServicesInterface {
  UsersApiService._();
  static final instance = UsersApiService._();

  @override
  Future<Response> applyService({Params? params}) async {
    return await call(
      urlFetchUsers,
      type: CrudType.get,
      params: params,
      auth: true,
      withPagination: true,
    );
  }
}
