import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/params/params.dart';
import 'package:dio/dio.dart';

class PatientsApiService extends ServicesInterface {
  PatientsApiService._();
  static final instance = PatientsApiService._();

  @override
  Future<Response> applyService({Params? params}) async {
    return await call(
      'patients', // Dummy URL
      type: CrudType.get,
      params: params,
    );
  }
}

class AddPatientApiService extends ServicesInterface {
  AddPatientApiService._();
  static final instance = AddPatientApiService._();

  @override
  Future<Response> applyService({Params? params}) async {
    return await call(
      'patients',
      type: CrudType.post,
      params: params,
    );
  }
}

class DeletePatientApiService extends ServicesInterface {
  DeletePatientApiService._();
  static final instance = DeletePatientApiService._();

  @override
  Future<Response> applyService({Params? params}) async {
    return await call(
      'patients/delete',
      type: CrudType.post,
      params: params,
    );
  }
}
