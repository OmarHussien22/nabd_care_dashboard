import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class CompleteDataApiService extends ServicesInterface {
  CompleteDataApiService._();

  static final instance = CompleteDataApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLCompleteData",
      type: CrudType.post,
      params: params,
      showLoadingDialog: true,
      auth: true,
    );
  }
}
