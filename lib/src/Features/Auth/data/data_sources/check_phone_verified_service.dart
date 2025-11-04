import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import 'package:dio/src/response.dart';
import '../../../../Core/NetworkStructure/Params/params.dart';

class CheckPhoneVerifiedService extends ServicesInterface {
  CheckPhoneVerifiedService._();

  static final instance = CheckPhoneVerifiedService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      "uRLCheckPhoneVerified",
      type: CrudType.get,
      auth: true,
      params: params,
      showLoadingDialog: true,
    );
  }
}
