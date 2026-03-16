import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Core/params/pagination_params.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/repo/fetch_patient_repo.dart';
import 'package:care_desk/src/Super/UseCase/user_case.dart';

class FetchPatientUseCase extends UseCase<List<PatientEntity>, PaginationParams> {
  @override
  Future<DataState<List<PatientEntity>>>? call({PaginationParams? params}) {
    return FetchPatientRepository.instance.call(params: params);
  }
}
