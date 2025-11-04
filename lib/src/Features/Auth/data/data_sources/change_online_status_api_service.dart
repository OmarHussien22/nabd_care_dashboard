import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class ChangeOnlineStatusApiService extends ServicesInterface {
  ChangeOnlineStatusApiService._();

  static final instance = ChangeOnlineStatusApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLChangeOnlineStatus",
      type: CrudType.post,
      auth: true,
      params: params,
      showLoadingDialog: false,
    );
  }
}
