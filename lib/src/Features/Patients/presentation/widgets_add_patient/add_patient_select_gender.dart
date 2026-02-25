import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/gender_entity.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientSelectGender extends StatelessWidget {
  const AddPatientSelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPatientBuilder>(builder: (cnt) {
      return Expanded(
        child: Column(
          children: [
            Row(
              children: [
                // Icon(Icons.person, color: AppColors.get.primary),
                // SizedBox(width: 8.toW()),
                CustomText(
                  "gender".toTr(),
                  fontSize: 13,
                  fontWeight: FW.medium,
                ),
              ],
            ),
            // SizedBox(height: 8.toH()),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<GenderEntity>(
                    title: CustomText(
                      "male".toTr(),
                      color: cnt.selectGender == GenderEntity.getGenderList[0]
                          ? AppColors.get.primary
                          : AppColors.get.black,
                      fontSize:
                          cnt.selectGender == GenderEntity.getGenderList[0]
                              ? 15
                              : 13,
                      fontWeight:
                          cnt.selectGender == GenderEntity.getGenderList[0]
                              ? FW.semiBold
                              : FW.medium,
                    ),
                    value: GenderEntity.getGenderList[0],
                    groupValue: cnt.selectGender,
                    onChanged: (value) {
                      cnt.setSelectedGender(value!);
                    },
                    activeColor: AppColors.get.primary,
                    contentPadding: EdgeInsets.zero,
                    hoverColor: AppColors.get.primary.withValues(alpha: .1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: AppColors.get.primary),
                    ),
                    // dense: true,
                    // autofocus: true,
                    mouseCursor: SystemMouseCursors.click,
                    overlayColor: WidgetStateProperty.all(
                      AppColors.get.primary.withValues(alpha: .1),
                    ),
                  ),
                ),
                Expanded(
                  child: RadioListTile<GenderEntity>(
                    title: CustomText(
                      "female".toTr(),
                      color: cnt.selectGender == GenderEntity.getGenderList[1]
                          ? AppColors.get.primary
                          : AppColors.get.black,
                      fontSize:
                          cnt.selectGender == GenderEntity.getGenderList[1]
                              ? 15
                              : 13,
                      fontWeight:
                          cnt.selectGender == GenderEntity.getGenderList[1]
                              ? FW.semiBold
                              : FW.medium,
                    ),
                    value: GenderEntity.getGenderList[1],
                    groupValue: cnt.selectGender,
                    onChanged: (value) {
                      cnt.setSelectedGender(value!);
                    },
                    activeColor: AppColors.get.primary,
                    contentPadding: EdgeInsets.zero,

                    hoverColor: AppColors.get.primary.withValues(alpha: .1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: AppColors.get.primary),
                    ),
                    // dense: true,
                    // autofocus: true,
                    mouseCursor: SystemMouseCursors.click,
                    overlayColor: WidgetStateProperty.all(
                      AppColors.get.primary.withValues(alpha: .1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
