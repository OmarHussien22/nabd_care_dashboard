import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientButtons extends StatelessWidget {
  final void Function()? onPressed;
  const AddPatientButtons({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonDefault(
            title: "cancel".toTr(),
            onPressed: () {
              Get.back();
            },
            backgroundColor: AppColors.get.white,
            titleColor: AppColors.get.primary,
          ),
        ),
        SizedBox(width: 12.toW()),
        Expanded(
          child: ButtonDefault(
            title: "save_patient".toTr(),
            onPressed: () {
              onPressed?.call();
              //Navigator.pop(context);
            },
            backgroundColor: AppColors.get.primary,
            titleColor: AppColors.get.white,
          ),
        ),
      ],
    );
  }
}
