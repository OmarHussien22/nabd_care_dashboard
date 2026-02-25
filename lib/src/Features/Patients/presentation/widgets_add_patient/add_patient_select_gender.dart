import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/general_static_entity.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Choice/Components/choice_radio_list_tile.dart';
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
        // SizedBox(height: 8.toH()),
        GetBuilder<AddPatientBuilder>(builder: (cnt) {
          return Row(
            children: [
              Expanded(
                child: ChoiceRadioListTile<GenderEntity>(
                  value: GenderEntity.getGenderList[0],
                  titlecolor: cnt.selectGender == GenderEntity.getGenderList[0]
                      ? AppColors.get.primary
                      : AppColors.get.black,
                  titleSize: cnt.selectGender == GenderEntity.getGenderList[0]
                      ? 15
                      : 13,
                  titleFontWeight:
                      cnt.selectGender == GenderEntity.getGenderList[0]
                          ? FW.semiBold
                          : FW.medium,
                  groupValue:
                      cnt.selectGender ?? GenderEntity.getGenderList.first,
                  onChanged: (value) {
                    cnt.setSelectedGender(value!);
                  },
                  activeColor: AppColors.get.primary,
                  hoverColor: AppColors.get.primary.withValues(alpha: .1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppColors.get.primary),
                  ),
                  // dense: true,
                  // autofocus: true,
                ),
                // RadioListTile<GenderEntity>(
                //   title: CustomText(
                //     "male".toTr(),
                //     color: cnt.selectGender == GenderEntity.getGenderList[0]
                //         ? AppColors.get.primary
                //         : AppColors.get.black,
                //     fontSize:
                //         cnt.selectGender == GenderEntity.getGenderList[0]
                //             ? 15
                //             : 13,
                //     fontWeight:
                //         cnt.selectGender == GenderEntity.getGenderList[0]
                //             ? FW.semiBold
                //             : FW.medium,
                //   ),
                //   value: GenderEntity.getGenderList[0],
                //   groupValue: cnt.selectGender,
                //   onChanged: (value) {
                //     cnt.setSelectedGender(value!);
                //   },
                //   activeColor: AppColors.get.primary,
                //   contentPadding: EdgeInsets.zero,
                //   hoverColor: AppColors.get.primary.withValues(alpha: .1),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     side: BorderSide(color: AppColors.get.primary),
                //   ),
                //   // dense: true,
                //   // autofocus: true,
                //   mouseCursor: SystemMouseCursors.click,
                //   overlayColor: WidgetStateProperty.all(
                //     AppColors.get.primary.withValues(alpha: .1),
                //   ),
                // ),
              ),
              Expanded(
                child: ChoiceRadioListTile<GenderEntity>(
                  value: GenderEntity.getGenderList[1],
                  titlecolor: cnt.selectGender == GenderEntity.getGenderList[1]
                      ? AppColors.get.primary
                      : AppColors.get.black,
                  titleSize: cnt.selectGender == GenderEntity.getGenderList[1]
                      ? 15
                      : 13,
                  titleFontWeight:
                      cnt.selectGender == GenderEntity.getGenderList[1]
                          ? FW.semiBold
                          : FW.medium,
                  groupValue:
                      cnt.selectGender ?? GenderEntity.getGenderList.first,
                  onChanged: (value) {
                    cnt.setSelectedGender(value!);
                  },
                  activeColor: AppColors.get.primary,
                  hoverColor: AppColors.get.primary.withValues(alpha: .1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppColors.get.primary),
                  ),
                  // dense: true,
                  // autofocus: true,
                ),
                // RadioListTile<GenderEntity>(
                //   title: CustomText(
                //     "female".toTr(),
                //     color: cnt.selectGender == GenderEntity.getGenderList[1]
                //         ? AppColors.get.primary
                //         : AppColors.get.black,
                //   fontSize:
                //       cnt.selectGender == GenderEntity.getGenderList[1]
                //           ? 15
                //           : 13,
                //   fontWeight:
                //       cnt.selectGender == GenderEntity.getGenderList[1]
                //           ? FW.semiBold
                //           : FW.medium,
                // ),
                // value: GenderEntity.getGenderList[1],
                // groupValue: cnt.selectGender,
                // onChanged: (value) {
                //   cnt.setSelectedGender(value!);
                // },
                // activeColor: AppColors.get.primary,
                // contentPadding: EdgeInsets.zero,

                // hoverColor: AppColors.get.primary.withValues(alpha: .1),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10),
                //   side: BorderSide(color: AppColors.get.primary),
                // ),
                // dense: true,
                // autofocus: true,
                //  mouseCursor: SystemMouseCursors.click,
                //   overlayColor: WidgetStateProperty.all(
                //     AppColors.get.primary.withValues(alpha: .1),
                //   ),
                // ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
