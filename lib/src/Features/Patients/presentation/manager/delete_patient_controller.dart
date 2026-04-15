


import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';

import '../../../../Core/network_structure/resources/data_state/data_state.dart';
import '../../../../Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';
import '../../core/delete_patient_params.dart';
import '../../domain/useCase/delete_patient_use_case.dart';
import 'package:get/get.dart';

import 'fetch_patient_controller.dart';
class DeletePatientController extends GetControllerInterface {

  Future<void> deletePatientById(int patientId, int currentPage) async {
    if (patientId <= 0) {
      ClientSnacks.requestError(error: 'Invalid patient id');
      return;
    }
    final beforeDeleteCount = state.data?.length ?? 0;
    final deleteState = await DeletePatientUseCase().call(
      params: DeletePatientParams(patientId: patientId),
    )!;
    if (deleteState is DataSuccess) {
      ClientSnacks.successMessage(
        message: deleteState.message ?? 'Patient deleted successfully',
      );
      if (beforeDeleteCount <= 1 && currentPage > 1) {
        currentPage -= 1;
      }
      await Get. find<FetchPatientController>().fetchPage(currentPage);
    } else if (deleteState is DataFailed) {
      ClientSnacks.requestError(error: deleteState.error?.title);
    }

    update();
  }


}