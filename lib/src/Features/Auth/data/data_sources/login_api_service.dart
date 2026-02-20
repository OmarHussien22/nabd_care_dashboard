import 'package:dio/src/response.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart';

class LoginApiService extends ServicesInterface {
  LoginApiService._();

  static final instance = LoginApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLLogin,
      type: CrudType.post,
      params: params,
      showLoadingDialog: true,
    );
  }
}
