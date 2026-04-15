import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Core/network_structure/resources/errors/error_model.dart';
import 'package:care_desk/src/Features/Patients/core/patient_details_params.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/useCase/fetch_patient_details_use_case.dart';
import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';

class PatientDetailsController extends GetControllerInterface<PatientEntity> {
  final int patientId;
  final PatientEntity? initialPatient;

  PatientDetailsController({
    required this.patientId,
    this.initialPatient,
  });

  PatientEntity get patient =>
      state.data ?? initialPatient ?? PatientEntity.empty;

  Future<void> fetchPatientDetails() async {

    emit(DataLoading(data: initialPatient ?? PatientEntity.empty));

    final useCase = FetchPatientDetailsUseCase();
     state = await useCase(
      params: PatientDetailsParams(patientId: patientId),
    )!;
    emit(state);
    if(state is DataSuccess){
      printDM('patient details fetched successfully for patientId: $patientId');
    }else{
      printDM('failed to fetch patient details for patientId: $patientId, state: $state');
    }


  }

  void retry() => fetchPatientDetails();

  @override
  void onInit() {
    fetchPatientDetails();
    super.onInit();
  }
}

