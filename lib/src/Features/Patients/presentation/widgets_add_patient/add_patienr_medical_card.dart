import 'package:care_desk/src/Core/Constants/Strings/Assets/app_icons.dart';
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
              AddPatientSelectVisit(),
            SizedBox(height: 16.toH()),
            CustomText(
              "chronic_diseases",
              fontSize: 13,
              fontWeight: FW.medium,
            ),
            SizedBox(height: 12.toH()),
            Wrap(
              spacing: 8.toW(),
              runSpacing: 8.toH(),
              children: DiseaseEntity.emptyList.map((disease) {
                return ChronicDiseaseChip(
                  label: disease.name,
                  isSelected: cnt.selectedChronicDiseases.contains(disease.id),
                  onTap: () {
                    cnt.setSelectedChronicDiseases(disease);
                    // setState(() {
                    //   if (_selectedChronicDiseases.contains(disease)) {
                    //     _selectedChronicDiseases.remove(disease);
                    //   } else {
                    //     _selectedChronicDiseases.add(disease);
                    //   }
                    // });
                  },
                );
              }).toList(),
            ),
            Row(
              children: [
                Expanded(
                  child: AppFillTextFieldField(
                    // width: 500,
                    controller: cnt.allergiesController,
                    hint: "enter_allergies",
                    header: "allergies",
                    prefixIconData: Icons.warning_amber_outlined,
                    keyboardType: TextInputType.name,
                    validation: AppValidator.defaultValidator.validate,
                    onComplete: node.nextFocus,
                  ),
                ),
                SizedBox(width: 16.toW()),
                Expanded(
                  child: AppFillTextFieldField(
                    // width: 500,
                    controller: cnt.mainComplaintController,
                    hint: "why_patient_here_today",
                    header: "main_complaint",
                    prefixIconData: Icons.notes,
                    keyboardType: TextInputType.name,
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
