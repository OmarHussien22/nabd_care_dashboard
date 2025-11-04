import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class ChangePasswordApiService extends ServicesInterface{
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