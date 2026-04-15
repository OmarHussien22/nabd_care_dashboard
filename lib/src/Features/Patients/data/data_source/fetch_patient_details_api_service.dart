import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:dio/src/response.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart';

class FetchPatientDetailsApiService extends ServicesInterface {
  FetchPatientDetailsApiService._();

  static final instance = FetchPatientDetailsApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      urlFetchPatientDetails,
      type: CrudType.get,
      auth: true,
      params: params,
      showLoadingDialog: false,
      withPagination: false,
    );
  }
}

