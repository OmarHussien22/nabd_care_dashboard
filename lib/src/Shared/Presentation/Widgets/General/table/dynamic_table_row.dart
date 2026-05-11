import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_action/custom_action_drop_down.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_column.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_row_data.dart';
import 'package:flutter/material.dart';

class DynamicTableRow extends StatefulWidget {
  final TableRowData row;
  final List<TableColumn> columns;
  final Function(int)? onEdit;
  final Function(int)? onDelete;
  final Function(int)? onView;

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.get.primary.withValues(alpha: 0.02)
              : Colors.white,
          border: Border(
            bottom: BorderSide(
              color: _isHovered 
                ? AppColors.get.primary.withValues(alpha: 0.1)
                : AppColors.get.border.withValues(alpha: 0.3)
            ),
          ),
        ),
        child: InkWell(
          onTap: widget.row.onTap,
          hoverColor: Colors.transparent,
          splashColor: AppColors.get.primary.withValues(alpha: 0.05),
          child: Row(
            children: [
              ...widget.columns.asMap().entries.map((entry) {
                final index = entry.key;
                final col = entry.value;
                return Container(
                  width: col.width,
                  constraints: const BoxConstraints(minHeight: 60),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  alignment: Alignment.centerLeft,
                  child: widget.row.cells.length > index
                      ? widget.row.cells[index]
                      : const SizedBox(),
                );
              }),
              // Actions Column
              Container(
                width: 100,
                alignment: Alignment.center,
                child: CustomActionDropDown(
                  rowId: widget.row.id,
                  onView: widget.onView,
                  onEdit: widget.onEdit,
                  onDelete: widget.onDelete,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
