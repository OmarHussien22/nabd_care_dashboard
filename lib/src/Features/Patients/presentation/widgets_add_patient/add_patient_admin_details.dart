import 'package:care_desk/src/Core/Constants/Strings/Assets/app_icons.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Core/Utils/Validation/app_validator.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/referral_sources.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/gender_card.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientAdminDetails extends StatelessWidget {
  final FocusNode node;
  const AddPatientAdminDetails({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPatientBuilder>(builder: (cnt) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Referral Source ──
          Row(
            children: [
              Icon(Icons.campaign_outlined,
                  size: 18, color: AppColors.get.primary),
              SizedBox(width: 8.toW()),
              CustomText(
                "referral_source",
                fontSize: 14,
                fontWeight: FW.bold,
              ),
            ],
          ),
          SizedBox(height: 12.toH()),
          // SizedBox(
          //   width: MediaQuery.sizeOf(context).width * 0.45,
          //   child: SearchableFieldDefault<ReferralSourcesEntity>(
          //     controller: cnt.referralSourceController,
          //     items: ReferralSourcesEntity.referralSources,
          //     itemLabel: (item) => item.title,
          //     hint: "select_referral_source",
          //     leadingIcon: AppIcons.whatsapp,
          //     suffix: SuffixNone(),
          //     inputDecoration: InputDecorationWithBorder(),
          //     onOptionSelected: cnt.setReferralSource,
          //   ),
          // ),
          // SizedBox(height: 24.toH()),

          // ── Secretary Notes ──
          AppFillTextFieldField(
            width: double.infinity,
            controller: cnt.secretaryNotesController,
            hint: "special_remarks_for_doctor",
            header: "secretary_notes",
            prefixIconData: Icons.note_alt_outlined,
            keyboardType: TextInputType.text,
            maxLines: 3,
            validation: AppValidator.defaultValidator.validate,
            onComplete: () => node.unfocus(),
          ),

          SizedBox(height: 24.toH()),
          // SizedBox(
          //   width: MediaQuery.sizeOf(context).width * 0.45,
          //   child: GenderCard(
          //     label: "referral_source".toTr(),
          //     icon: Icons.female_rounded,
          //     isSelected: cnt.selectReferralSourceId ==
          //         ReferralSourcesEntity.referralSources[1].id,
          //     onTap: () => cnt
          //         .setReferralSource(ReferralSourcesEntity.referralSources[1]),
          //   ),
          // ),
          //
        ],
      );
    });
  }
}
