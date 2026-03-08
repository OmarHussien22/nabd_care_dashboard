import 'package:care_desk/src/Core/Constants/Strings/Assets/app_icons.dart';
import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Dialogs/app_dialogs.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class DialogAddPatientSuccess {
  static void showDialog() {
    AppDialogs.showPreviewDialog(
      width: 380.toW(),
      height: 380.toH(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageGeneric.asset(
            url: AppIcons.success,
            options: ImageOptions(
              width: 120,
              height: 130,
            ),
          ),
          30.ESH(),
          CustomText(
            "add_patient_success",
            fontSize: 14,
            fontWeight: FW.bold,
          ),
        ],
      ),
    );
  }
}
