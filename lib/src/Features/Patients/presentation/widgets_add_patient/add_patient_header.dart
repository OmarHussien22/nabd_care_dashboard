import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/add_patient_builder.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/patient_stepper_controller.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientHeader extends StatelessWidget {
  final int currentStep;
  const AddPatientHeader({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      styles: WrapAnimationStyles.fade,
      durationStyle: WrapDurationStyle.fast,
      child: context.isPhone
          ? Container(
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
                  horizontal: context.isPhone ? 16 : 24.toW(),
                  vertical: context.isPhone ? 12 : 16.toH(),
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
                            Get.find<PatientStepController>().back();
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

                    // Step counter chip
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.isPhone ? 12 : 14.toW(),
                        vertical: context.isPhone ? 6 : 6.toH(),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.get.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.get.primary.withOpacity(0.25),
                          width: 1,
                        ),
                      ),
                      child: CustomText(
                        '${'step'.toTr()} ${currentStep + 1} / 4',
                        fontSize: 13,
                        fontWeight: FW.semiBold,
                        color: AppColors.get.primary,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: AppInsets.defaultScreenALL,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //   width: 44,
                  //   height: 44,
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //       colors: [
                  //         AppColors.get.primary,
                  //         AppColors.get.primaryLight,
                  //       ],
                  //     ),
                  //     borderRadius: BorderRadius.circular(12),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: AppColors.get.primary.withOpacity(0.3),
                  //         blurRadius: 8,
                  //         offset: const Offset(0, 3),
                  //       ),
                  //     ],
                  //   ),
                  //   child: const Icon(
                  //     Icons.person_add_alt_1_rounded,
                  //     color: Colors.white,
                  //     size: 22,
                  //   ),
                  // ),
                  // 12.ESW(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:  14.toW(),
                      vertical:  6.toH(),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.get.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.get.primary.withOpacity(0.25),
                        width: 1,
                      ),
                    ),
                    child: CustomText(
                      '${'step'.toTr()} ${currentStep + 1} / 4',
                      fontSize: 13,
                      fontWeight: FW.semiBold,
                      color: AppColors.get.primary,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
