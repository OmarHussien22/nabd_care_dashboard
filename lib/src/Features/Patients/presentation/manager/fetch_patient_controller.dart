import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Core/params/pagination_params.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/useCase/fetch_patient_use_case.dart';
import 'package:care_desk/src/Shared/Managers/pagination_table_controller.dart';
import 'package:get/get.dart';

class FetchPatientController
    extends PaginationTableController<List<PatientEntity>> {
  // ── Overrides ──────────────────────────────────────────────────────────

  /// Fetches patients for [page] and emits the resulting [DataState].
  ///
  /// Called on initial load (page 1) and every time the user presses a
  /// page-navigation button in the table.
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

  // ── Lifecycle ──────────────────────────────────────────────────────────

  @override
  void onInit() {
    fetchPage(1);   // load the first page on controller creation
    super.onInit();
  }
}
