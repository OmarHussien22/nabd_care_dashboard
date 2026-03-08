import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patient_stepper_controller.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_completed_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_header.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_section_card.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/card_stepper_content.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/step_navigation_buttons.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/stepper_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode node = FocusScope.of(context);
    Get.put(PatientStepController());
    return Scaffold(
      backgroundColor: AppColors.get.lighterGrey,
      body: GetBuilder<PatientStepController>(builder: (cnt) {
        return Column(
          children: [
            // ─── Header (no stepper) ───────────────────────────
            GetBuilder<PatientStepController>(
              id: PatientStepController.updateHeaderId,
              builder: (cnt) => AddPatientHeader(currentStep: cnt.currentStep),
            ),

            // ─── Scrollable Content ───────────────────────────
            Expanded(
              child: Form(
                key: cnt.globalKey,
                child: SingleChildScrollView(
                  controller: cnt.scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.toW(),
                    vertical: 16.toH(),
                  ),
                  child: GetBuilder<PatientStepController>(
                    builder: (cnt) {
                      final step = cnt.currentStep;
                      return Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 900),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ── Stepper above current card ─────────────
                              StepperRow(),
                              SizedBox(height: 20.toH()),

                              // ── Completed cards (collapsed, above active) ─
                              for (int i = 0; i < step; i++)
                                AddPatientCompletedCard(
                                  icon: cnt.kSteps[i].$1,
                                  title: cnt.kSteps[i].$2.toTr(),
                                  onEdit: () => cnt.goToStep(i),
                                ),

                              // ── Active step card ────────────────────────
                              AddPatientSectionCard(
                                key: cnt.sectionKeys[step],
                                icon: cnt.kSteps[step].$1,
                                title: cnt.kSteps[step].$2.toTr(),
                                isActive: true,
                                children: [
                                  CardStepperContent(step: step, node: node),
                                  // ── Step navigation ──────────────
                                  StepNavigationButtons(
                                    isLastStep: step == cnt.kSteps.length - 1,
                                    nextStepLabel: step < cnt.kSteps.length - 1
                                        ? cnt.kSteps[step].$3?.toTr()
                                        : null,
                                    onNext: cnt.nextStep,
                                    onBack: cnt.back,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // Widget _buildStepperRow(AddPatientBuilder cnt) {
  //   return StepperAddPatient(
  //     currentStep: cnt.currentStep,
  //     onStepTapped: (i) {
  //       // Only allow navigating back to completed steps
  //       if (i <= cnt.currentStep) {
  //         cnt.goToStep(i);
  //       }
  //     },
  //     steps: [
  //       for (final s in cnt.kSteps) (s.$1, s.$2.toTr()),
  //     ],
  //   );
  // }

  // Widget _buildStepContent(int step, FocusScopeNode node) {
  //   switch (step) {
  //     case 0:
  //       return AddPatientInformationCard(node: node);
  //     case 1:
  //       return AddPatienrMedicalCard(node: node);
  //     case 2:
  //       return AddPatientAttachmentCard(node: node);
  //     case 3:
  //       return AddPatientAdminDetails(node: node);
  //     default:
  //       return const SizedBox.shrink();
  //   }
  // }
}
