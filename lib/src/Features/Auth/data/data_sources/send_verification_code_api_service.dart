import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class SendVerificationCodeApiService extends ServicesInterface {
  SendVerificationCodeApiService._();

  static final instance = SendVerificationCodeApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLSendVerificationCode",
      type: CrudType.post,
      params: params,
      showLoadingDialog: true,
    );
  }
}
