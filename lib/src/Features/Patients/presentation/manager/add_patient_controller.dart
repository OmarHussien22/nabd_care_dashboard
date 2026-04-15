import 'package:care_desk/src/Core/network_structure/resources/data_state/data_state.dart';
import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/MainLayout/controller/main_layout_controller.dart';
import 'package:care_desk/src/Features/Patients/core/add_patinet_params.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Features/Patients/domain/useCase/add_patient_use_case.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/dialog_add_patient_success.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patient_stepper_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Snackbar/client_snacks.dart';

import '../../../../Core/Utils/general_utils.dart';
import '../../../../Super/Controllers/Resources/get/get_controller_interface.dart';
import 'package:get/get.dart';

class AddPatientController extends GetControllerInterface<PatientEntity> {
  final addPatientbuilder = Get.put(AddPatientBuilder());

  void addPatient() async {
    emit(const DataLoading());
    final AddPatientUseCase useCase = AddPatientUseCase();
    state = await useCase(params: addPatientbuilder.toMap())!;
    if (state is DataSuccess) {
      // Future.delayed(const Duration(milliseconds: 1500), () {
      //   Get.offAllNamed(
      //     AppRoutes.mainApp,
      //     predicate: (route) {
      //       return route.settings.name == AppRoutes.mainApp;
      //     },
      //   );

      // });
      DialogAddPatientSuccess.showDialog();
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Get.delete<PatientStepController>();
        // Get.find<AddPatientBuilder>().clear();
        Get.find<MainLayoutController>().pushAndRemoveUntil(AppRoutes.patients);
        Get.find<MainLayoutController>().selectItem(2);
      });
    } else {
      ClientSnacks.requestError(
        error: state.error?.title ?? "problem_in_adding_patient",
      );
    }
    emit(state);
  }

  void addPatientTest() async {
    emit(DataLoading(data: PatientEntity.empty));
    final AddPatientUseCase useCase = AddPatientUseCase();
    state = await useCase(
        params: AddPatinetParams(
      name: "",
      phone: "",
      address: "",
      mainComplaint: "",
      allergies: "",
      notes: "",
      dateOfBirth: "",
      referralSource: 1,
      gender: 1,
      visitType: 1,
      chronicDiseases: [],
      medications: [],
      attachments: [],
      age: "",
      dateOfVisit: "",
      timeOfVisit: "",
      price: "",
    ))!;
    if (state is DataSuccess) {
      printDM('done');
    } else {
      printDM("change online status is${state.message ?? "failed"} ");
    }
    update();
  }
}
