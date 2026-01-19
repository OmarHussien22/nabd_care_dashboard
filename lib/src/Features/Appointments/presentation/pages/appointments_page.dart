import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/dynamic_table.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/Inputs/desktop_input.dart';
import 'package:flutter/material.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
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
                color: index % 3 == 0 ? AppPalette.success : AppPalette.warning,
                fontWeight: FW.semiBold,
              ),
            ),
          ],
          onTap: () {},
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final columns = [
      const TableColumn(label: "Patient Name", width: 400),
      const TableColumn(label: "Time", width: 120),
      const TableColumn(label: "Doctor", width: 180),
      const TableColumn(label: "Type", width: 150),
      const TableColumn(label: "Status", width: 120),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText("Today's Appointments",
                      fontSize: 24,
                      fontWeight: FW.bold,
                      color: AppPalette.textPrimary),
                  SizedBox(height: 4),
                  CustomText("Manage your daily schedule",
                      color: AppPalette.textSecondary),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const CustomText("New Appointment"),
              ),
            ],
          ),
          const SizedBox(height: 5),

          // Filters
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: DesktopInput(
                    label: "",
                    hint: "Search patients...",
                    prefixIcon: const Icon(Icons.search, size: 20)),
              ),
              const SizedBox(width: 16),
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  // side: const BorderSide(color: AppPalette.border),
                  // alignment: Alignment.centerLeft,
                  fixedSize: const Size(100, 42),
                ),
                icon: const Icon(Icons.filter_list, size: 18),
                label: const CustomText("Filter"),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Table
          Expanded(
            child: DynamicTable(
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
            ),
          ),
        ],
      ),
    );
  }
}
