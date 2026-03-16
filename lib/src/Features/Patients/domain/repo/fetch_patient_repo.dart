
import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import 'package:care_desk/src/Features/Patients/data/data_source/fetch_patient_api_service.dart';
import 'package:care_desk/src/Features/Patients/data/model/patient_model.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';

class FetchPatientRepository extends RepoInterface<List<PatientEntity>> {
  FetchPatientRepository._();

  static final instance = FetchPatientRepository._();

  @override
  ServicesInterface get serviceInstance => FetchPatientApiService.instance;
  @override
  List<PatientEntity> Function(dynamic data) get onParse => (data) {
        return List<PatientEntity>.from(data.map((x) => PatientModel.fromJson(x)));
      };

  @override
  List<PatientEntity> get devData => PatientEntity.emptyList;

  @override
  List<PatientEntity> get testData => PatientEntity.emptyList;
}
