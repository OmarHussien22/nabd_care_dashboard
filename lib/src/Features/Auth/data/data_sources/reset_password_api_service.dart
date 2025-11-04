import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

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
