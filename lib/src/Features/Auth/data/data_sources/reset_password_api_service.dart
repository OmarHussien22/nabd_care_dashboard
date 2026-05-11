import 'package:dio/src/response.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';

class ResetPasswordApiService extends ServicesInterface {
  ResetPasswordApiService._();

  static final instance = ResetPasswordApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLResetPassword,
      type: CrudType.post,
      params: params,
      showLoadingDialog: true,
    );
  }
}
