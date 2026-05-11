import 'package:flutter/material.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import '../../../../Shared/Presentation/Widgets/tables/table/custom_table.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentWrapper(
      title: 'Appointments Schedule',
      breadcrumb: const AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'Dashboard', route: '/dashboard'),
          BreadcrumbItem(label: 'Appointments'),
        ],
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.calendar_month_outlined, size: 20),
          label: const Text('View Calendar'),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.toRad())),
          ),
        ),
        16.ESW(),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_task_rounded, size: 20),
          label: const Text('New Appointment'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.get.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.toRad())),
            elevation: 0,
          ),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.toRad()),
          border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
        ),
        child: CustomTable(
          columnNames: const ['Patient', 'Time', 'Doctor', 'Visit Type', 'Status'],
          data: [
            [_buildPatientCell('John Smith', 'JS'), '09:00 AM', 'Dr. Sarah Bennett', _buildTypeBadge('Consultation'), _buildStatusBadge('Confirmed', Colors.blue)],
            [_buildPatientCell('Sarah Jane', 'SJ'), '10:30 AM', 'Dr. Sarah Bennett', _buildTypeBadge('Follow-up'), _buildStatusBadge('Completed', Colors.green)],
            [_buildPatientCell('Michael Ross', 'MR'), '11:15 AM', 'Dr. Robert Fox', _buildTypeBadge('Emergency'), _buildStatusBadge('Pending', Colors.orange)],
            [_buildPatientCell('Emma Wilson', 'EW'), '02:00 PM', 'Dr. Sarah Bennett', _buildTypeBadge('Check-up'), _buildStatusBadge('Cancelled', Colors.red)],
          ],
          customRowActions: [
            (data) => ActionIconButton(
              icon: Icons.check_circle_outline,
              color: Colors.green,
              onTap: () {},
              tooltipMessage: 'Mark as Completed',
            ),
            (data) => ActionIconButton(
              icon: Icons.edit_outlined,
              color: AppColors.get.primary,
              onTap: () {},
              tooltipMessage: 'Reschedule',
            ),
            (data) => ActionIconButton(
              icon: Icons.cancel_outlined,
              color: Colors.red,
              onTap: () {},
              tooltipMessage: 'Cancel Appointment',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCell(String name, String initials) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16.toRad(),
          backgroundColor: AppColors.get.primary.withOpacity(0.1),
          child: CustomText(initials, fontSize: 4, fontWeight: FW.bold, color: AppColors.get.primary),
        ),
        12.ESW(),
        CustomText(name, fontSize: 4.2, fontWeight: FW.semiBold, color: AppColors.get.textPrimary),
      ],
    );
  }

  Widget _buildTypeBadge(String type) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.toW(), vertical: 4.toH()),
      decoration: BoxDecoration(
        color: AppColors.get.background,
        borderRadius: BorderRadius.circular(8.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: CustomText(type, fontSize: 3.5, color: AppColors.get.textSecondary, fontWeight: FW.medium),
    );
  }

  Widget _buildStatusBadge(String status, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.toW(), vertical: 4.toH()),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.toRad()),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: CustomText(status, fontSize: 3.5, color: color, fontWeight: FW.semiBold),
    );
  }
}
