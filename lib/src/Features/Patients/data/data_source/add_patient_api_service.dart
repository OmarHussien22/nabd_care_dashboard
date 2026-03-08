import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/core/network_structure/params/params.dart';
import 'package:dio/src/response.dart';

class AddPatientApiService extends ServicesInterface {
  AddPatientApiService._();

  static final instance = AddPatientApiService._();

  @override
  Future<Response> applyService({Params? params}) {
    return super.call(
      urlAddPatient,
      type: CrudType.post,
      auth: true,
      params: params,
      showLoadingDialog: true,
      uploadOptions: uploadOptions,
    );
  }
}
