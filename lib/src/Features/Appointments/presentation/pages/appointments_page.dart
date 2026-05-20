import 'package:care_desk/src/Core/Services/lang_service/translate_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_content_wrapper.dart';
import '../../../../Shared/Presentation/Widgets/Layout/presentation/widgets/app_breadcrumb.dart';
import '../../../../Shared/Presentation/Widgets/tables/table/custom_table.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Features/Appointments/presentation/manager/appointments_controller.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentsController());

    return AppContentWrapper(
      title: 'appointments_schedule'.toTr(),
      breadcrumb: AppBreadcrumb(
        items: [
          BreadcrumbItem(label: 'dashboard'.toTr(), route: '/dashboard'),
          BreadcrumbItem(label: 'appointments'.toTr()),
        ],
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () => context.go('/appointments/calendar'),
          icon: const Icon(Icons.calendar_month_outlined, size: 20),
          label: CustomText('view_calendar'.toTr(), fontWeight: FW.bold),
          style: OutlinedButton.styleFrom(
            padding:
                EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.toRad())),
            side: BorderSide(color: AppColors.get.border),
          ),
        ),
        16.ESW(),
        ElevatedButton.icon(
          onPressed: () => context.go('/appointments/create'),
          icon: const Icon(Icons.add_task_rounded, size: 20),
          label: CustomText('new_appointment'.toTr(),
              fontWeight: FW.bold, color: Colors.white),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.get.primary,
            foregroundColor: Colors.white,
            padding:
                EdgeInsets.symmetric(horizontal: 20.toW(), vertical: 12.toH()),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.toRad())),
            elevation: 0,
          ),
        ),
      ],
      child: Obx(() {
        final list = controller.appointments;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.toRad()),
            border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
          ),
          child: CustomTable(
            isLoading: controller.isLoading.value,
            emptyTitle: 'no_appointments_slotted'.toTr(),
            emptyDescription: 'no_appointments_desc'.toTr(),
            emptyAction: () => context.go('/appointments/create'),
            emptyActionLabel: 'book_appointment'.toTr(),
            columnNames: [
              'patient'.toTr(),
              'time'.toTr(),
              'doctor'.toTr(),
              'visit_type'.toTr(),
              'status'.toTr()
            ],
            data: list
                .map((appt) => [
                      _buildPatientCell(appt.patientName, appt.initials),
                      appt.time,
                      appt.doctorName,
                      _buildTypeBadge(appt.visitType),
                      _buildStatusBadge(appt.status, appt.statusColor),
                    ])
                .toList(),
            customRowActions: [
              (data) {
                // Safely extract the patient name to query index
                final patientCell = data[0] as Row;
                final nameTextWidget =
                    patientCell.children.whereType<CustomText>().last;
                final patientName = nameTextWidget.label ?? '';
                final apptIndex =
                    list.indexWhere((e) => e.patientName == patientName);
                if (apptIndex == -1) return const SizedBox();
                final appt = list[apptIndex];

                final isCompleted = appt.status == 'Completed';

                return ActionIconButton(
                  icon: isCompleted
                      ? Icons.cancel_outlined
                      : Icons.check_circle_outline,
                  color: isCompleted ? Colors.red : Colors.green,
                  onTap: () {
                    if (isCompleted) {
                      controller.cancelAppointment(appt.id);
                    } else {
                      controller.completeAppointment(appt.id);
                    }
                  },
                  tooltipMessage: isCompleted
                      ? 'cancel_appointment'.toTr()
                      : 'complete_appointment'.toTr(),
                );
              },
              (data) {
                final patientCell = data[0] as Row;
                final nameTextWidget =
                    patientCell.children.whereType<CustomText>().last;
                final patientName = nameTextWidget.label ?? '';
                final apptIndex =
                    list.indexWhere((e) => e.patientName == patientName);
                if (apptIndex == -1) return const SizedBox();
                final appt = list[apptIndex];

                return ActionIconButton(
                  icon: Icons.edit_calendar_rounded,
                  color: AppColors.get.primary,
                  onTap: () => context.go('/appointments/edit/${appt.id}'),
                  tooltipMessage: 'reschedule_slot'.toTr(),
                );
              },
              (data) {
                final patientCell = data[0] as Row;
                final nameTextWidget =
                    patientCell.children.whereType<CustomText>().last;
                final patientName = nameTextWidget.label ?? '';
                final apptIndex =
                    list.indexWhere((e) => e.patientName == patientName);
                if (apptIndex == -1) return const SizedBox();
                final appt = list[apptIndex];

                return ActionIconButton(
                  icon: Icons.delete_outline_rounded,
                  color: Colors.grey.shade700,
                  onTap: () => controller.deleteAppointment(appt.id),
                  tooltipMessage: 'remove_log'.toTr(),
                );
              },
            ],
          ),
        );
      }),
    );
  }

  Widget _buildPatientCell(String name, String initials) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16.toRad(),
          backgroundColor: AppColors.get.primary.withOpacity(0.1),
          child: CustomText(initials,
              fontSize: 10, fontWeight: FW.bold, color: AppColors.get.primary),
        ),
        12.ESW(),
        CustomText(name,
            fontSize: 13,
            maxLines: 1,
            isOverFlow: true,
            fontWeight: FW.semiBold,
            color: AppColors.get.textPrimary),
      ],
    );
  }

  String _translateVisitType(String type) {
    final lower = type.toLowerCase().replaceAll('-', '').replaceAll(' ', '_');
    if (lower == 'consultation' || lower == 'followup' || lower == 'routine') {
      return lower.toTr();
    }
    return type;
  }

  String _translateStatus(String status) {
    final lower = status.toLowerCase();
    if (lower == 'scheduled' || lower == 'completed' || lower == 'cancelled' || lower == 'pending') {
      return lower.toTr();
    }
    return status;
  }

  Widget _buildTypeBadge(String type) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.toW(), vertical: 4.toH()),
      decoration: BoxDecoration(
        color: AppColors.get.background,
        borderRadius: BorderRadius.circular(8.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Center(
        child: CustomText(_translateVisitType(type),
            fontSize: 12,
            color: AppColors.get.textSecondary,
            fontWeight: FW.medium),
      ),
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
      child: Center(
        child: CustomText(_translateStatus(status),
            fontSize: 12, color: color, fontWeight: FW.semiBold),
      ),
    );
  }
}
