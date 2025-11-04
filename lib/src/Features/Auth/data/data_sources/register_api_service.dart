import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class RegisterApiService extends ServicesInterface{
  RegisterApiService._();

  static final instance = RegisterApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
        uRLRegister,
        type: CrudType.post,
        params: params,
        showLoadingDialog: true,
    );
  }


}