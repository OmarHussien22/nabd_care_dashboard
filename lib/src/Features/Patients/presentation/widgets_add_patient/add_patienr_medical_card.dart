import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Core/Utils/Validation/app_validator.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/disease_entity.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/chronic_disease_chip.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/add_patient_select_visit.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatienrMedicalCard extends StatelessWidget {
  final FocusScopeNode node;

  const AddPatienrMedicalCard({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPatientBuilder>(
      builder: (cnt) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Visit Type Selection ──
            const AddPatientSelectVisit(),
            SizedBox(height: 24.toH()),

            // ── Chronic Diseases Section ──
            Row(
              children: [
                Icon(Icons.history_edu_rounded,
                    size: 18, color: AppColors.get.primary),
                SizedBox(width: 8.toW()),
                CustomText(
                  "chronic_diseases",
                  fontSize: 14,
                  fontWeight: FW.bold,
                ),
              ],
            ),
            SizedBox(height: 4.toH()),
            CustomText(
              "select_any_existing_medical_conditions",
              fontSize: 12,
              color: AppColors.get.textSecondary,
            ),
            SizedBox(height: 12.toH()),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.toW()),
              decoration: BoxDecoration(
                color: AppColors.get.greyLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Wrap(
                spacing: 10.toW(),
                runSpacing: 10.toH(),
                children: DiseaseEntity.emptyList.map((disease) {
                  return ChronicDiseaseChip(
                    label: disease.name,
                    isSelected:
                        cnt.selectedChronicDiseasesIds.contains(disease.id),
                    onTap: () => cnt.setSelectedChronicDiseases(disease),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24.toH()),

            // ── Allergies & Complaint Row ──
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppFillTextFieldField(
                    controller: cnt.allergiesController,
                    hint: "enter_allergies",
                    header: "allergies",
                    prefixIconData: Icons.warning_amber_rounded,
                    keyboardType: TextInputType.text,
                    validation: AppValidator.defaultValidator.validate,
                    onComplete: node.nextFocus,
                  ),
                ),
                SizedBox(width: 20.toW()),
                Expanded(
                  child: AppFillTextFieldField(
                    controller: cnt.mainComplaintController,
                    hint: "why_patient_here_today",
                    header: "main_complaint",
                    prefixIconData: Icons.chat_bubble_outline_rounded,
                    keyboardType: TextInputType.text,
                    validation: AppValidator.defaultValidator.validate,
                    onComplete: node.nextFocus,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
