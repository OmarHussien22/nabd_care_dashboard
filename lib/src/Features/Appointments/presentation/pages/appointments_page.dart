import 'package:care_desk/src/Core/utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Features/Appointments/presentation/widgets/appointments_actions_toolbar.dart';
import 'package:care_desk/src/Features/Appointments/presentation/widgets/appointments_table.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Animation/animated_wrapper.dart';
import 'package:flutter/material.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      styles: WrapAnimationStyles.slide,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.toW()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AppointmentsActionsToolbar(),
            SizedBox(height: 16),
            Expanded(
              child: AppointmentsTable(),
            ),
          ],
        ),
      ),
    );
  }
}
