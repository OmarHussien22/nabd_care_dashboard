import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patient_details_controller.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_details/patient_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entity/patient_entity.dart';

class PatientDetailsPage extends StatelessWidget {
  const PatientDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    final PatientDetailsArgs? detailsArgs =
        args is PatientDetailsArgs ? args : null;

    final int patientId = detailsArgs?.patientId ??
        (args is int ? args : int.tryParse(args?.toString() ?? '') ?? 0);

    final PatientEntity? initialPatient =
        detailsArgs?.patient is PatientEntity
            ? detailsArgs?.patient as PatientEntity
            : (args is PatientEntity ? args : null);

    return GetBuilder<PatientDetailsController>(
      init: PatientDetailsController(
        patientId: patientId,
        initialPatient: initialPatient,
      ),
      builder: (_) => const PatientDetailsScreen(),
    );
  }
}

