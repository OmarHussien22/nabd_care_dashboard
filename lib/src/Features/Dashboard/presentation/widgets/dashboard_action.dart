import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Dashboard/presentation/widgets/dialog_export_report.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/dialogs/animate_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardAction extends StatelessWidget {
  const DashboardAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonDefault.icon(
          height: 50.toH(),
          width: 180.toW(),
          label: "export_report".toTr(),
          icon: Icons.download_outlined,
          onPressed: () {
            Dialogs.animatedDialog(
              context: context,
              child: const ExportReportDialog(),
            );
          },
          backgroundColor: AppColors.get.primary,
          borderRadius: 8.toRad(),
        ),
        16.ESW(),
        ButtonDefault.icon(
          height: 50.toH(),
          width: 180.toW(),
          label: "new_appointment".toTr(),
          icon: Icons.add_outlined,
          onPressed: () {
            context.go('/appointments/create');
          },
          backgroundColor: AppColors.get.primary,
          borderRadius: 8.toRad(),
        ),
      ],
    );
  }
}
