import 'package:care_desk/src/Core/network_structure/networking/src/utils/upload_option.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Features/Patients/core/add_patinet_params.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/repo/add_patient_repo.dart';
import 'package:care_desk/src/Super/UseCase/use_case_upload.dart';

class AddPatientUseCase extends UseCaseUpload<PatientEntity, AddPatinetParams> {
  @override
  Future<DataState<PatientEntity>>? call(
      {AddPatinetParams? params, UploadOptions? uploadOptions}) {
    return AddPatientRepository.instance.call(
      params: params,
      uploadoption: uploadOptions,
    );
  }
}
