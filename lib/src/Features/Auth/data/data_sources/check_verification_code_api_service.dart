import 'package:dio/src/response.dart';

import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart';

class CheckVerificationCodeApiService extends ServicesInterface {
  CheckVerificationCodeApiService._();

  static final instance = CheckVerificationCodeApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLCheckVerificationCode",
      type: CrudType.post,
      params: params,
      showLoadingDialog: true,
    );
  }
}
