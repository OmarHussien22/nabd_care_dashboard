import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patienr_medical_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_admin_details.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_attachment_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_information_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardStepperContent extends StatelessWidget {
  final int step;
  final FocusScopeNode node;
  const CardStepperContent({super.key, required this.step, required this.node});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPatientBuilder());
    switch (step) {
      case 0:
        return AddPatientInformationCard(node: node);
      case 1:
        return AddPatienrMedicalCard(node: node);
      case 2:
        return AddPatientAttachmentCard(node: node);
      case 3:
        return AddPatientAdminDetails(node: node);
      default:
        return const SizedBox.shrink();
    }
  }
}
