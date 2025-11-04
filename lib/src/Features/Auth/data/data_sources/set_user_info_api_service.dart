import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class SetUserInfoApiService extends ServicesInterface {
  SetUserInfoApiService._();

  static final instance = SetUserInfoApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLSetUserInfo",
      type: CrudType.post,
      params: params,
      showLoadingDialog: true,
      auth: true,
    );
  }
}
