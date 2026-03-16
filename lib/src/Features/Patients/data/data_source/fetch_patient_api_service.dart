import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart';
import 'package:dio/src/response.dart';

class FetchPatientApiService extends ServicesInterface {
  FetchPatientApiService._();

  static final instance = FetchPatientApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      urlFetchPatients,
      type: CrudType.get,
      auth: true,
      params: params,
      showLoadingDialog: true,
      withPagination: true,
      //uploadOptions: uploadOptions,
    );
  }
}
