import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/general_static_entity.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Choice/Components/choice_radio_list_tile.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientSelectVisit extends StatelessWidget {
  const AddPatientSelectVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          "visit_type",
          fontSize: 13,
          fontWeight: FW.medium,
        ),
        SizedBox(height: 8.toH()),
        GetBuilder<AddPatientBuilder>(builder: (cnt) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ChoiceRadioListTile<VisitTypeEntity>(
                width: 300.toW(),
                value: VisitTypeEntity.getVisitTypeList[0],
                cardColor:
                    cnt.selectVisitType == VisitTypeEntity.getVisitTypeList[0]
                        ? AppColors.get.primary.withValues(alpha: .1)
                        : AppColors.get.greyLight.withValues(alpha: .3),
                titlecolor:
                    cnt.selectVisitType == VisitTypeEntity.getVisitTypeList[0]
                        ? AppColors.get.primary
                        : AppColors.get.black,
                titleSize:
                    cnt.selectVisitType == VisitTypeEntity.getVisitTypeList[0]
                        ? 15
                        : 13,
                titleFontWeight:
                    cnt.selectVisitType == VisitTypeEntity.getVisitTypeList[0]
                        ? FW.semiBold
                        : FW.medium,
                groupValue: cnt.selectVisitType ??
                    VisitTypeEntity.getVisitTypeList.first,
                onChanged: (value) {
                  cnt.setSelectedVisitType(value!);
                },
                activeColor: AppColors.get.primary,
                hoverColor: AppColors.get.primary.withValues(alpha: .1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColors.get.primary),
                ),
              ),
              20.ESW(),
              ChoiceRadioListTile<VisitTypeEntity>(
                width: 300.toW(),
                value: VisitTypeEntity.getVisitTypeList[1],
                cardColor:
                    cnt.selectVisitType == VisitTypeEntity.getVisitTypeList[1]
                        ? AppColors.get.primary.withValues(alpha: .1)
                        : AppColors.get.greyLight.withValues(alpha: .3),
                titlecolor:
                    cnt.selectVisitType == VisitTypeEntity.getVisitTypeList[1]
                        ? AppColors.get.primary
                        : AppColors.get.black,
                titleSize:
                    cnt.selectVisitType == VisitTypeEntity.getVisitTypeList[1]
                        ? 15
                        : 13,
                titleFontWeight:
                    cnt.selectVisitType == VisitTypeEntity.getVisitTypeList[1]
                        ? FW.semiBold
                        : FW.medium,
                groupValue: cnt.selectVisitType ??
                    VisitTypeEntity.getVisitTypeList.first,
                onChanged: (value) {
                  cnt.setSelectedVisitType(value!);
                },
                activeColor: AppColors.get.primary,
                hoverColor: AppColors.get.primary.withValues(alpha: .1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColors.get.primary),
                ),
              )
            ],
          );
        }),
      ],
    );
  }
}
