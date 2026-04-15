import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Patients/core/patient_details_params.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/repo/fetch_patient_details_repo.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';

class FetchPatientDetailsUseCase
    extends UseCase<PatientEntity, PatientDetailsParams> {
  @override
  Future<DataState<PatientEntity>>? call({PatientDetailsParams? params}) {
    return FetchPatientDetailsRepository.instance.call(params: params);
  }
}

