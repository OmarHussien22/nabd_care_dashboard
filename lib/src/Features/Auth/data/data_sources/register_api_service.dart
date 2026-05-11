import 'package:dio/src/response.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';

class RegisterApiService extends ServicesInterface {
  RegisterApiService._();

  static final instance = RegisterApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLRegister,
      type: CrudType.post,
      params: params,
      showLoadingDialog: true,
    );
  }
}
