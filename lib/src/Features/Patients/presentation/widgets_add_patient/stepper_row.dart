

import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/stepper_add_patient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../manager/patient_stepper_controller.dart';
class StepperRow extends StatelessWidget {
  const StepperRow({super.key});

  @override
  Widget build(BuildContext context) {
   final cnt= Get.find<PatientStepController>();
    return StepperAddPatient(
      currentStep: cnt.currentStep,
      onStepTapped: (i) {
        if (i <= cnt.currentStep) {
          cnt.goToStep(i);
        }
      },
      steps: [
        for (final s in cnt.kSteps) (s.$1, s.$2.toTr()),
      ],
    );
  }
}