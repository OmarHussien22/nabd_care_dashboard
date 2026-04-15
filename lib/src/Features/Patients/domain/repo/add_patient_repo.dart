
import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import 'package:care_desk/src/Features/Patients/data/data_source/add_patient_api_service.dart';
import 'package:care_desk/src/Features/Patients/data/model/patient_model.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';

class AddPatientRepository extends RepoInterface<PatientEntity> {
  AddPatientRepository._();

  static final instance = AddPatientRepository._();

  @override
  ServicesInterface get serviceInstance => AddPatientApiService.instance;
  @override
  PatientEntity Function(dynamic data) get onParse => (data) {
        return PatientModel.fromJson(data);
      };

  @override
  PatientEntity get devData => PatientEntity.empty;

  @override
  PatientEntity get testData => PatientEntity.empty;
}
