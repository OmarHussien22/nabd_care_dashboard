import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

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
