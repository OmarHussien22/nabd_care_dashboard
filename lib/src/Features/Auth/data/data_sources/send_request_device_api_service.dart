import 'package:dio/src/response.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class SendRequestDeviceApiService extends ServicesInterface {
  SendRequestDeviceApiService._();

  static final instance = SendRequestDeviceApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLSendRequestDevice",
      type: CrudType.post,
      auth: true,
      params: params,
      showLoadingDialog: true,
    );
  }
}
