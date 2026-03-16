import 'package:care_desk/src/Features/Patients/presentation/manager/fetch_patient_controller.dart';
import 'package:get/get.dart';
import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patients_actions_toolbar.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patients_table.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:flutter/material.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FetchPatientController());
    return AnimatedWrapper(
      styles: WrapAnimationStyles.slide,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // PatientsHeader(),
          // SizedBox(height: 16),
          PatientsActionsToolbar(),
          SizedBox(height: 16),
          Expanded(child: PatientsTable()),
        ],
      ),
    );
  }
}
