import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets_add_patient/stepper_add_patient.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddPatientHeader extends StatelessWidget {
  final int currentStep;
  const AddPatientHeader({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      styles: WrapAnimationStyles.fade,
      durationStyle: WrapDurationStyle.fast,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.get.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.get.greyLight.withOpacity(0.35),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border(
            bottom: BorderSide(
              color: AppColors.get.border,
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.toW(),
            vertical: 16.toH(),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Material(
                color: AppColors.get.surfaceContainer,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    if (currentStep == 0) {
                      Get.back();
                    } else {
                      Get.find<AddPatientBuilder>().back();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.get.textSecondary,
                      size: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.toW()),

              // Icon badge
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.get.primary,
                      AppColors.get.primaryLight,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.get.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_add_alt_1_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              SizedBox(width: 14.toW()),

              // Titles
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'add_new_patient'.toTr(),
                      fontSize: 18,
                      fontWeight: FW.bold,
                      color: AppColors.get.textPrimary,
                    ),
                    SizedBox(height: 2.toH()),
                    CustomText(
                      'fill_in_the_patient_details_below'.toTr(),
                      fontSize: 13,
                      fontWeight: FW.regular,
                      color: AppColors.get.textSecondary,
                    ),
                  ],
                ),
              ),

              // Step indicator chips
              StepperAddPatient(
                currentStep: currentStep,
                steps: const [
                  (Icons.person_outline_rounded, 'info'),
                  (Icons.medical_services_outlined, 'medical'),
                  (Icons.attach_file_rounded, 'media'),
                  (Icons.admin_panel_settings_outlined, 'admin'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
