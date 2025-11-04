import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

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
