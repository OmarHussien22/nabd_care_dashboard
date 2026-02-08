import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_action/custom_action_drop_down.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_column.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_row_data.dart';
import 'package:flutter/material.dart';

class DynamicTableRow extends StatefulWidget {
  final TableRowData row;
  final List<TableColumn> columns;
  final Function(String)? onEdit;
  final Function(String)? onDelete;
  final Function(String)? onView;

  const DynamicTableRow({
    super.key,
    required this.row,
    required this.columns,
    this.onEdit,
    this.onDelete,
    this.onView,
  });

  @override
  State<DynamicTableRow> createState() => _DynamicTableRowState();
}

class _DynamicTableRowState extends State<DynamicTableRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.get.surfaceContainer.withOpacity(0.5)
              : Colors.white,
          border: Border(bottom: BorderSide(color: AppColors.get.border)),
        ),
        child: InkWell(
          onTap: widget.row.onTap,
          child: Row(
            children: [
              ...widget.columns.asMap().entries.map((entry) {
                final index = entry.key;
                final col = entry.value;
                return Container(
                  width: col.width,
                  constraints: const BoxConstraints(minHeight: 52),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  alignment: Alignment.centerLeft,
                  child: widget.row.cells.length > index
                      ? widget.row.cells[index]
                      : const SizedBox(),
                );
              }),
              // Actions
              CustomActionDropDown(
                rowId: widget.row.id,
                onView: widget.onView,
                onEdit: widget.onEdit,
                onDelete: widget.onDelete,
              )
            ],
          ),
        ),
      ),
    );
  }
}
