import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/general_utils.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/TextFields/Default/default_text_field.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.45,
      child: SearchableFieldDefault<String>(
        items: [
          "Omar",
          "Fathy",
          "Ahmed",
          "Omar",
          "Fathy",
          "Fathy",
          "Ahmed",
          "Omar",
          "Fathy",
          "Ahmed",
          "Omar",
          "Fathy",
          "Ahmed",
        ],
        prefix: PrefixWithIconData(
          iconData: Icons.search,
          scale: 1.5,
          color: AppColors.get.textSecondary,
        ),
        itemLabel: (item) => item,
        hint: "search_for_patient_by_name_or_phone",
        onOptionSelected: (selected) {
          printDM("Selected: $selected");
        },
      ),
    );
  }
}
