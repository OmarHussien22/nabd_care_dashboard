import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import 'package:care_desk/src/Features/Patients/data/data_source/delete_patient_api_service.dart';

class DeletePatientRepository extends RepoInterface<void> {
  DeletePatientRepository._();

  static final instance = DeletePatientRepository._();

  @override
  ServicesInterface get serviceInstance => DeletePatientApiService.instance;

  @override
  void Function(dynamic data) get onParse => (data) {
        return;
      };

  @override
  ResponseType get responseType => ResponseType.withoutData;
}

