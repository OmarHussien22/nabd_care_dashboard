import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Inputs/desktop_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientsActionsToolbar extends StatelessWidget {
  const PatientsActionsToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 300.toW(),
          child: DesktopInput(
            label: "",
            hint: "Search by name or ID...",
            prefixIcon: Icons.search,
          ),
        ),
        const SizedBox(width: 16),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.filter_list, size: 18),
          style: OutlinedButton.styleFrom(
            fixedSize: const Size(120, 42),
          ),
          label: const CustomText("Filter"),
        ),
        Spacer(),
        ElevatedButton.icon(
          onPressed: () {
            Get.toNamed("${AppRoutes.addPatient}/1");
          },
          icon: const Icon(Icons.add),
          label: CustomText(
            "Add Patient",
            color: AppColors.get.white,
          ),
        ),
      ],
    );
  }
}
