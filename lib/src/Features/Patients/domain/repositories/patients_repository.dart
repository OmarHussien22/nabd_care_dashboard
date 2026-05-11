import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import '../../data/data_sources/patients_api_service.dart';
import '../../data/models/patient_model.dart';
import '../entities/patient_entity.dart';

class PatientsRepository extends RepoInterface<List<PatientEntity>> {
  PatientsRepository._();
  static final instance = PatientsRepository._();

  @override
  ServicesInterface get serviceInstance => PatientsApiService.instance;

  @override
  List<PatientEntity> Function(dynamic data) get onParse => (data) {
        return (data as List? ?? [])
            .map<PatientEntity>((e) => PatientModel.fromJson(e))
            .toList();
      };

  @override
  List<PatientEntity>? get devData => PatientEntity.dummyPatients;
}

class AddPatientRepository extends RepoInterface<PatientEntity> {
  AddPatientRepository._();
  static final instance = AddPatientRepository._();

  @override
  ServicesInterface get serviceInstance => AddPatientApiService.instance;

  @override
  PatientEntity Function(dynamic data) get onParse =>
      (data) => PatientModel.fromJson(data) as PatientEntity;

  @override
  PatientEntity? get devData => PatientEntity.dummyPatients.first;
}

class DeletePatientRepository extends RepoInterface<void> {
  DeletePatientRepository._();
  static final instance = DeletePatientRepository._();

  @override
  ServicesInterface get serviceInstance => DeletePatientApiService.instance;

  @override
  void Function(dynamic data) get onParse => (data) {};

  @override
  void get devData => null;
}
