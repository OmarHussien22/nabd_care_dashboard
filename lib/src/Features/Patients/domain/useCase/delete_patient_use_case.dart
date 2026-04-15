import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Patients/core/delete_patient_params.dart';
import 'package:care_desk/src/Features/Patients/domain/repo/delete_patient_repo.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';

class DeletePatientUseCase extends UseCase<void, DeletePatientParams> {
  @override
  Future<DataState<void>>? call({DeletePatientParams? params}) {
    return DeletePatientRepository.instance.call(params: params);
  }
}

