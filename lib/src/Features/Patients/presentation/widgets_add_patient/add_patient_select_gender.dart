import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/general_static_entity.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/gender_card.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientSelectGender extends StatelessWidget {
  const AddPatientSelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          "gender".toTr(),
          fontSize: 13,
          fontWeight: FW.medium,
        ),
        SizedBox(height: 12.toH()),
        GetBuilder<AddPatientBuilder>(builder: (cnt) {
          return Row(
            children: [
              // ── Male Card ──
              Expanded(
                child: GenderCard(
                  label: "male".toTr(),
                  icon: Icons.male_rounded,
                  isSelected: cnt.selectGender == GenderEntity.getGenderList[0],
                  onTap: () =>
                      cnt.setSelectedGender(GenderEntity.getGenderList[0]),
                ),
              ),
              SizedBox(width: 12.toW()),
              // ── Female Card ──
              Expanded(
                child: GenderCard(
                  label: "female".toTr(),
                  icon: Icons.female_rounded,
                  isSelected: cnt.selectGender == GenderEntity.getGenderList[1],
                  onTap: () =>
                      cnt.setSelectedGender(GenderEntity.getGenderList[1]),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
