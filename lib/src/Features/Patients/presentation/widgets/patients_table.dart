import 'package:care_desk/src/Features/Patients/presentation/manager/fetch_patient_controller.dart';
import 'package:care_desk/src/Features/Patients/presentation/manager/handle_patient_table.dart';
import 'package:care_desk/src/Features/Patients/presentation/widgets/patient_table_row_data.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/DataBuilder/imports_data_builder.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/dynamic_table.dart';
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
        onTap: () {},
      ),
      currentPage: controller.currentPage,
      totalPages: controller.totalPages,
      onPageChanged: (page) => controller.goToPage(page),
      onView: (id) {
        // TODO: navigate to patient detail
      },
      onEdit: (id) {
        // TODO: open edit patient dialog
      },
      onDelete: (id) {
        // TODO: confirm & delete patient
      },
    );
  }
}
