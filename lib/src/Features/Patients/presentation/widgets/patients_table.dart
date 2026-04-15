import 'package:care_desk/src/Core/routers/app_router_imports.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/delete_patient_controller.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/fetch_patient_controller.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/handle_patient_table.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_table_row_data.dart';
import 'package:care_desk/src/Features/Patients/domain/entity/patient_entity.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/DataBuilder/imports_data_builder.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/dynamic_table.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Dialogs/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientsTable extends StatelessWidget {
  const PatientsTable({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchPatientController>(
      builder: (controller) {
        return DataStatusBuilder(
          status: controller.state,
          useShimmer: true,
          isOnRefreshed: controller.paginationLoading,
          onDoneBuild: _buildTable(controller),
        );
      },
    );
  }

  Widget _buildTable(FetchPatientController controller) {
    final patients = controller.state.data ?? [];
    return DynamicTable(
      columns: HandlePatientTable.instance.patientColumns,
      rows: PatientTableRowData.patientRowsTable(
        patients: patients,
        onTap: (id) => _openDetails(patients, id),
      ),
      currentPage: controller.currentPage,
      totalPages: controller.totalPages,
      onPageChanged: (page) => controller.goToPage(page),
      onView: (id) => _openDetails(patients, id),
      onEdit: (id) {
        // TODO: open edit patient dialog
      },
      onDelete: (id) => _confirmDelete(
        context: Get.context,
        id: id,
       currentPage: controller.currentPage,
      ),
    );
  }

  void _confirmDelete({
    required BuildContext? context,
    required int id,
    required int currentPage,

  }) {
    final patientId = id ?? 0;
    if (context == null || patientId <= 0) return;
    AppDialogs.showConfirmDialog(
      context: context,
      title: 'Are you sure you want to delete this patient?',
      confirmLabel: 'delete',
      confirm: () {
        Navigator.of(context).pop();
       Get.put(DeletePatientController()).deletePatientById(patientId, currentPage);
      },
    );
  }

  void _openDetails(List<PatientEntity> patients, int id) {
    final patientId = id ?? 0;
    final selected = patients.firstWhere(
      (patient) => patient.id == patientId,
       orElse: () => PatientEntity.empty,
    );

    Get.toNamed(
      AppRoutes.patientDetails,
      arguments: PatientDetailsArgs(
        patientId: patientId,
        patient: selected == PatientEntity.empty ? null : selected,
      ),
    );
  }
}
