import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Inputs/desktop_input.dart';
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
          child: DesktopInput(
              label: "", hint: "Search patients...", prefixIcon: Icons.search),
        ),
        const SizedBox(width: 16),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            fixedSize: const Size(100, 42),
          ),
          icon: const Icon(Icons.filter_list, size: 18),
          label: const CustomText("Filter"),
        ),
        Spacer(),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: CustomText(
            "New Appointment",
            color: AppColors.get.white,
          ),
        ),
      ],
    );
  }
}
