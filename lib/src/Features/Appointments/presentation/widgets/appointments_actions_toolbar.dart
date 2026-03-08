import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/app_text_field.dart';
import 'package:flutter/material.dart';

class AppointmentsActionsToolbar extends StatelessWidget {
  const AppointmentsActionsToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 300.toW(),
          child: AppFillTextFieldField(
            controller: TextEditingController(),
            hint: "search_appointment",
            verticalPadding: 10.toH(),
            surroundingPadding: EdgeInsets.symmetric(horizontal: 10.toH()),
            prefixIconData: Icons.search,
            prefixScale: 1.5,
            keyboardType: TextInputType.text,
            //  validation: AppValidator.defaultValidator.validate,
            //   onComplete: node.nextFocus,
          ),
        ),
        const SizedBox(width: 16),
        ButtonDefault.icon(
          width: 120.toW(),
          padding: AppInsets.defaultButtonVertical,
          onPressed: () {},
          borderRadius: AppInsets.buttonBorderRadius,
          icon: Icons.filter_list,
          label: "filter",
          titleColor: AppColors.get.primary,
          iconColor: AppColors.get.primary,
          color: AppColors.get.white,
          backgroundColor: AppColors.get.background,
        ),
        Spacer(),
        ButtonDefault.icon(
          width: 180.toW(),
          padding: AppInsets.defaultButtonVertical,
          onPressed: () {
            //Get.toNamed(AppRoutes.addPatient);
          },
          titleSize: 14,
          borderRadius: AppInsets.buttonBorderRadius,
          icon: Icons.calendar_month,
          label: "add_appointment",
        ),
      ],
    );
  }
}
