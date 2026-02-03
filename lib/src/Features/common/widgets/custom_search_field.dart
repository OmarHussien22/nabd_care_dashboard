import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.45,
      child: Padding(
        padding: AppInsets.defaultScreenALL,
        child: TextFieldDefault(
          hint: TFFHint(
              title: "search for patient Or Phone Or ID ..".toTr(),
              fontSize: 15),
          prefix: PrefixWithIconData(
            iconData: Icons.search,
            color: AppColors.get.tTFPrefixColor,
            scale: 1,
            size: 25,
          ),
          controller: TextEditingController(),
          inputDecoration: InputDecorationWithBorder(
            enableBorderColor: AppColors.get.greyLight,
          ),
        ),
      ),
    );
  }
}
