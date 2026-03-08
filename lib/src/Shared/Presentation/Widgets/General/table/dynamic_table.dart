import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/dynamic_table_row.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_column.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_header.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_pagination.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_row_data.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

export 'table_column.dart';
export 'table_row_data.dart';

class DynamicTable extends StatefulWidget {
  final List<TableColumn> columns;
  final List<TableRowData> rows;
  final Function(String)? onEdit;
  final Function(String)? onDelete;
  final Function(String)? onView;
  final Function(int)? onPageChanged;
  final int currentPage;
  final int totalPages;

  const DynamicTable({
    super.key,
    required this.columns,
    required this.rows,
    this.onEdit,
    this.onDelete,
    this.onView,
    this.onPageChanged,
    this.currentPage = 1,
    this.totalPages = 1,
  });

  @override
  State<DynamicTable> createState() => _DynamicTableState();
}

class _DynamicTableState extends State<DynamicTable> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  double _calculateTableWidth() {
    double width = 0;
    for (final col in widget.columns) {
      width += col.width;
    }
    return width + 100;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.get.white,
          border: Border.all(color: AppColors.get.border),
          borderRadius: AppInsets.defaultTableBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                  thickness: WidgetStateProperty.all(10),
                  radius: const Radius.circular(8),
                  thumbColor: WidgetStateProperty.all(AppColors.get.greyLight),
                  trackColor: WidgetStateProperty.all(AppColors.get.white),
                ),
                child: Scrollbar(
                  controller: _horizontalController,
                  thumbVisibility: true, // 👈 يظهر دايمًا
                  trackVisibility: true,
                  interactive: true, // 👈 تمسكه بالماوس
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  child: SingleChildScrollView(
                    controller: _horizontalController,
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: _calculateTableWidth(),
                      child: Scrollbar(
                        controller: _verticalController,
                        thumbVisibility: true,
                        interactive: true,
                        child: SingleChildScrollView(
                          controller: _verticalController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TableHeader(
                                  columns: widget
                                      .columns), // 👈 الهيدر يتحرك يمين وشمال
                              if (widget.rows.isEmpty)
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                    child: CustomText(
                                      "No data available",
                                      color: AppPalette.textSecondary,
                                    ),
                                  ),
                                )
                              else
                                ...widget.rows.map(
                                  (row) => DynamicTableRow(
                                    row: row,
                                    columns: widget.columns,
                                    onEdit: widget.onEdit,
                                    onDelete: widget.onDelete,
                                    onView: widget.onView,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Pagination Footer
            TablePagination(
              currentPage: widget.currentPage,
              totalPages: widget.totalPages,
              onPageChanged: widget.onPageChanged,
            ),
          ],
        ),
      ),
    );
  }
}
