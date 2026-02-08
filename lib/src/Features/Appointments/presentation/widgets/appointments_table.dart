import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/dynamic_table.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class AppointmentsTable extends StatefulWidget {
  const AppointmentsTable({super.key});

  @override
  State<AppointmentsTable> createState() => _AppointmentsTableState();
}

class _AppointmentsTableState extends State<AppointmentsTable> {
  int _currentPage = 1;
  final int _totalPages = 5;
  List<TableRowData> _rows = [];

  @override
  void initState() {
    super.initState();
    _fetchAppointments(_currentPage);
  }

  void _fetchAppointments(int page) {
    // Simulate fetching data for the specific page
    // In a real app, this would be an API call
    if (mounted) {
      setState(() {
        _currentPage = page;
        _rows = List.generate(10, (index) {
          // Offset the index based on the page to show different data
          final absoluteIndex = (page - 1) * 10 + index;

          return TableRowData(
            id: "appt_$absoluteIndex",
            cells: [
              Row(children: [
                CircleAvatar(
                    radius: 14,
                    backgroundColor: AppPalette.primary.withOpacity(0.1),
                    child: CustomText("P${absoluteIndex + 1}",
                        fontSize: 10, color: AppPalette.primary)),
                const SizedBox(width: 8),
                CustomText("Patient Name ${absoluteIndex + 1}",
                    fontWeight: FW.medium),
              ]),
              CustomText("09:${(index * 5).toString().padLeft(2, '0')} AM"),
              const CustomText("Dr. Sarah Bennett"),
              const Chip(
                  label: CustomText("Consultation", fontSize: 10),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: index % 3 == 0
                      ? AppPalette.success.withOpacity(0.1)
                      : AppPalette.warning.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CustomText(
                  index % 3 == 0 ? "Completed" : "Pending",
                  fontSize: 11,
                  color:
                      index % 3 == 0 ? AppPalette.success : AppPalette.warning,
                  fontWeight: FW.semiBold,
                ),
              ),
            ],
            onTap: () {},
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final columns = [
      const TableColumn(label: "Patient Name", width: 400),
      const TableColumn(label: "Time", width: 120),
      const TableColumn(label: "Doctor", width: 180),
      const TableColumn(label: "Type", width: 150),
      const TableColumn(label: "Status", width: 120),
      const TableColumn(label: "Type", width: 150),
      const TableColumn(label: "Status", width: 120),
      const TableColumn(label: "Type", width: 150),
      const TableColumn(label: "Status", width: 120),
      const TableColumn(label: "Type", width: 150),
      const TableColumn(label: "Status", width: 120),
    ];

    return DynamicTable(
      columns: columns,
      rows: _rows,
      currentPage: _currentPage,
      totalPages: _totalPages,
      onPageChanged: (page) {
        _fetchAppointments(page);
      },
      onEdit: (id) {},
      onDelete: (id) {},
      onView: (id) {},
    );
  }
}
