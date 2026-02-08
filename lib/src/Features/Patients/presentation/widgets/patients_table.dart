import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/dynamic_table.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class PatientsTable extends StatelessWidget {
  const PatientsTable({super.key});

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
      final statusColor = isNewBook ? AppColors.get.primary : Colors.orange;

      return TableRowData(
        id: "pat_$index",
        cells: [
          CustomText("#${1000 + index}", fontWeight: FW.bold, fontSize: 12),
          Row(
            children: [
              CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.get.surfaceContainer,
                  child: Icon(Icons.person,
                      size: 14, color: AppColors.get.textSecondary)),
              const SizedBox(width: 8),
              Expanded(
                  child: CustomText(
                "Patient Name assadsadsa ${index + 1}",
                fontWeight: FW.medium,
                fontSize: 12,
              )),
            ],
          ),
          const CustomText("32", fontSize: 12),
          CustomText("2024-10-${(index % 30 + 1).toString().padLeft(2, '0')}",
              fontSize: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: CustomText(statusLabel,
                fontSize: 11, color: statusColor, fontWeight: FW.semiBold),
          ),
          const CustomText("\$5000.00", fontWeight: FW.bold, fontSize: 12),
          Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppColors.get.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 12, color: AppColors.get.textSecondary),
            ],
          ),
          Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppColors.get.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 12, color: AppColors.get.textSecondary),
            ],
          ),
          Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppColors.get.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 12, color: AppColors.get.textSecondary),
            ],
          ),
          Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppColors.get.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 12, color: AppColors.get.textSecondary),
            ],
          ),
          Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppColors.get.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 12, color: AppColors.get.textSecondary),
            ],
          ),
          Row(
            children: [
              Icon(Icons.attach_file,
                  size: 16, color: AppColors.get.textSecondary),
              SizedBox(width: 4),
              CustomText("2 Files",
                  fontSize: 12, color: AppColors.get.textSecondary),
            ],
          ),
        ],
        onTap: () {},
      );
    });

    return DynamicTable(
      columns: columns,
      rows: rows,
      currentPage: 1,
      totalPages: 8,
      onPageChanged: (p) {},
      onView: (id) {},
      onEdit: (id) {},
      onDelete: (id) {},
    );
  }
}
