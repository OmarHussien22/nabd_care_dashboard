import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';
import 'package:dio/dio.dart';

class AddUserApiService extends ServicesInterface {
  AddUserApiService._();
  static final instance = AddUserApiService._();

  @override
  Future<Response> applyService({Params? params}) async {
    return await call(
      urlAddUser,
      type: CrudType.post,
      params: params,
      auth: true,
    );
  }
}
