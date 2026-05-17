import 'package:care_desk/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/dynamic_table_row.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_column.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_header.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_pagination.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_row_data.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/scrollable/custom_scrollbar.dart';
import 'package:flutter/material.dart';

import '../../Illustrations/illustration_empty_data.dart';

export 'table_column.dart';
export 'table_row_data.dart';

class DynamicTable extends StatefulWidget {
  final List<TableColumn> columns;
  final List<TableRowData> rows;
  final Function(int)? onEdit;
  final Function(int)? onDelete;
  final Function(int)? onView;

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
    // Actions column width + extra buffer
    width += 100;

    final screenWidth = MediaQuery.of(context).size.width;
    if (width < screenWidth) {
      return screenWidth;
    } else {
      return width;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tableWidth = _calculateTableWidth();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.get.white,
        borderRadius: AppInsets.defaultTableBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: AppColors.get.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Table Body with Sticky Header support
          Expanded(
            child: CustomScrollbar(
              controller: _horizontalController,
              child: SingleChildScrollView(
                controller: _horizontalController,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: tableWidth,
                  child: Column(
                    children: [
                      // Sticky Header
                      TableHeader(columns: widget.columns),

                      // Scrollable Rows
                      Expanded(
                        child: CustomScrollbar(
                          controller: _verticalController,
                          scrollbarOrientation: ScrollbarOrientation.right,
                          child: SingleChildScrollView(
                            controller: _verticalController,
                            child: widget.rows.isEmpty
                                ? SizedBox(
                                    height: 400,
                                    child:
                                        Center(child: IllustrationEmptyData()),
                                  )
                                : Column(
                                    children: widget.rows
                                        .map(
                                          (row) => DynamicTableRow(
                                            row: row,
                                            columns: widget.columns,
                                            onEdit: widget.onEdit,
                                            onDelete: widget.onDelete,
                                            onView: widget.onView,
                                          ),
                                        )
                                        .toList(),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Pagination Footer with distinct styling
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                    color: AppColors.get.border.withValues(alpha: 0.5)),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: TablePagination(
              currentPage: widget.currentPage,
              totalPages: widget.totalPages,
              onPageChanged: widget.onPageChanged,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }
}
