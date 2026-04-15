import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Core/params/pagination_params.dart';
import 'package:care_desk/src/Features/Patients/core/delete_patient_params.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/useCase/delete_patient_use_case.dart';
import 'package:care_desk/src/Features/Patients/domain/useCase/fetch_patient_use_case.dart';
import 'package:care_desk/src/Shared/Managers/pagination_table_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';

class FetchPatientController
    extends PaginationTableController<List<PatientEntity>> {

  @override
  Future<void> fetchPage(int page) async {
    emit(DataLoading(data: PatientEntity.emptyList));
    final FetchPatientUseCase useCase = FetchPatientUseCase();
    state = await useCase(params: PaginationParams(page: page))!;
    if (state is DataSuccess) {
      printDM('patients page $page loaded – count: ${state.data?.length}');
    } else {
      printDM('error fetching patients page $page: ${state.error}');
    }
    emit(state);
  }

  // Future<void> deletePatientById(int patientId) async {
  //   if (patientId <= 0) {
  //     ClientSnacks.requestError(error: 'Invalid patient id');
  //     return;
  //   }
  //   final beforeDeleteCount = state.data?.length ?? 0;
  //   final deleteState = await DeletePatientUseCase().call(
  //     params: DeletePatientParams(patientId: patientId),
  //   )!;
  //   if (deleteState is DataSuccess) {
  //     ClientSnacks.successMessage(
  //       message: deleteState.message ?? 'Patient deleted successfully',
  //     );
  //     if (beforeDeleteCount <= 1 && currentPage > 1) {
  //       currentPage -= 1;
  //     }
  //     await fetchPage(currentPage);
  //   } else if (deleteState is DataFailed) {
  //     ClientSnacks.requestError(error: deleteState.error?.title);
  //   }
  //
  //   update();
  // }

  // ── Lifecycle ──────────────────────────────────────────────────────────

  @override
  void onInit() {
    fetchPage(1); // load the first page on controller creation
    super.onInit();
  }
}
