import 'package:care_desk/src/Core/network_structure/data_source/service_interface.dart';
import 'package:care_desk/src/Core/network_structure/repository/repo_interface.dart';
import 'package:care_desk/src/Features/Patients/data/data_source/fetch_patient_details_api_service.dart';
import 'package:care_desk/src/Features/Patients/data/model/patient_model.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';

class FetchPatientDetailsRepository extends RepoInterface<PatientEntity> {
  FetchPatientDetailsRepository._();

  static final instance = FetchPatientDetailsRepository._();

  @override
  ServicesInterface get serviceInstance => FetchPatientDetailsApiService.instance;

  @override
  PatientEntity Function(dynamic data) get onParse => (data) {
        if (data is Map<String, dynamic>) {
          return PatientModel.fromJson(data);
        }
        if (data is List && data.isNotEmpty && data.first is Map<String, dynamic>) {
          return PatientModel.fromJson(data.first as Map<String, dynamic>);
        }
        return PatientEntity.empty;
      };

  @override
  PatientEntity get devData => PatientEntity.empty;

  @override
  PatientEntity get testData => PatientEntity.empty;
}

