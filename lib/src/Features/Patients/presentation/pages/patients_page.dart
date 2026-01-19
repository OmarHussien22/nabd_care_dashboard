import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/dynamic_table.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Inputs/desktop_input.dart';
import 'package:flutter/material.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Columns: Name, Age, Patient ID, Booking Day, Attachments, Actions, Price, Status
    final columns = [
      const TableColumn(label: "Patient ID", width: 120),
      const TableColumn(label: "Name", width: 180),
      const TableColumn(label: "Age", width: 80),
      const TableColumn(label: "Booking Day", width: 140),
      const TableColumn(
          label: "Status", width: 120), // New Book / Re-disclosure
      const TableColumn(label: "Price", width: 100),
      const TableColumn(label: "Attachments", width: 160),
      const TableColumn(label: "Attachments", width: 160),
      const TableColumn(label: "Attachments", width: 160),
      const TableColumn(label: "Attachments", width: 160),
      const TableColumn(label: "Attachments", width: 160),
      const TableColumn(label: "Attachments", width: 160),
    ];

    final rows = List.generate(15, (index) {
      final isNewBook = index % 2 == 0;
      final statusLabel = isNewBook ? "New Book" : "Re-disclosure";
      final statusColor = isNewBook ? AppPalette.primary : Colors.orange;

      return TableRowData(
        id: "pat_$index",
        cells: [
          CustomText("#${1000 + index}", fontWeight: FW.bold, fontSize: 12),
          Row(
            children: [
              CircleAvatar(
                  radius: 12,
                  backgroundColor: AppPalette.surfaceContainer,
                  child: Icon(Icons.person,
                      size: 14, color: AppPalette.textSecondary)),
              const SizedBox(width: 8),
              Expanded(
                  child: CustomText(
                "Patient Name assadsadsa ${index + 1}",
                fontWeight: FW.medium,
              )),
            ],
          ),
          const CustomText("32"),
          CustomText("2024-10-${(index % 30 + 1).toString().padLeft(2, '0')}"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: CustomText(statusLabel,
                fontSize: 11, color: statusColor, fontWeight: FW.semiBold),
          ),
          const CustomText("\$5000.00", fontWeight: FW.bold),
          const Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppPalette.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 11, color: AppPalette.textSecondary),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppPalette.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 11, color: AppPalette.textSecondary),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppPalette.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 11, color: AppPalette.textSecondary),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppPalette.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 11, color: AppPalette.textSecondary),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppPalette.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 11, color: AppPalette.textSecondary),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppPalette.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 11, color: AppPalette.textSecondary),
            ],
          ),
        ],
        onTap: () {},
      );
    });

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText("Patients Directory",
              fontSize: 24, fontWeight: FW.bold, color: AppPalette.textPrimary),
          const SizedBox(height: 16),

          // Filters
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: DesktopInput(
                    label: "",
                    hint: "Search by name or ID...",
                    prefixIcon: const Icon(Icons.search, size: 20)),
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
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const CustomText("Add Patient"),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DynamicTable(
                columns: columns,
                rows: rows,
                currentPage: 1,
                totalPages: 8,
                onPageChanged: (p) {},
                onView: (id) {},
                onEdit: (id) {},
                onDelete: (id) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
