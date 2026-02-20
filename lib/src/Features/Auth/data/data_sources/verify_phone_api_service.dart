import 'package:dio/src/response.dart';
import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart';

class VerifyPhoneApiService extends ServicesInterface {
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
