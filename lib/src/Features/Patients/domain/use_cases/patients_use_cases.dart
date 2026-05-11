import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';
import '../entities/patient_entity.dart';
import '../repositories/patients_repository.dart';
import '../../core/patients_params.dart';

class FetchPatientsUseCase extends UseCase<List<PatientEntity>, FetchPatientsParams> {
  @override
  Future<DataState<List<PatientEntity>>>? call({FetchPatientsParams? params}) {
    return PatientsRepository.instance.call(params: params);
  }
}

class AddPatientUseCase extends UseCase<PatientEntity, AddPatientParams> {
  @override
  Future<DataState<PatientEntity>>? call({AddPatientParams? params}) {
    return AddPatientRepository.instance.call(params: params);
  }
}

class DeletePatientUseCase extends UseCase<void, DeletePatientParams> {
  @override
  Future<DataState<void>>? call({DeletePatientParams? params}) {
    return DeletePatientRepository.instance.call(params: params);
  }
}
