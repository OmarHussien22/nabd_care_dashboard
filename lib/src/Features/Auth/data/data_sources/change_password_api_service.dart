import 'package:dio/src/response.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart';

class ChangePasswordApiService extends ServicesInterface {
  ChangePasswordApiService._();

  static final instance = ChangePasswordApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      uRLChangePassword,
      type: CrudType.post,
      auth: true,
      params: params,
      showLoadingDialog: true,
    );
  }
}
