import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class VerifyPhoneApiService extends ServicesInterface{
  VerifyPhoneApiService._();

  static final instance = VerifyPhoneApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
        uRLVerifyPhone,
        type: CrudType.get,
        auth: true,
        params: params,
        showLoadingDialog: true,
    );
  }


}