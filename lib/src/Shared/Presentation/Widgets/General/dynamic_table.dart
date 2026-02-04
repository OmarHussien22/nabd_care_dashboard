import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class TableColumn {
  final String label;
  final double width;
  final bool isSortable;

  const TableColumn({
    required this.label,
    this.width = 150,
    this.isSortable = false,
  });
}

class TableRowData {
  final String id;
  final List<Widget> cells;
  final VoidCallback? onTap;

  TableRowData({
    required this.id,
    required this.cells,
    this.onTap,
  });
}

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
  String? _hoveredRowId;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppPalette.border),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            // Table Body with Scroll
            Expanded(
              child: SingleChildScrollView(
                // scrollDirection: Axis.horizontal,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sticky Header (in scroll view for horizontal sync, sticky not easy horizontally without SyncScroll, so keeping simple Header first)
                    // Note: For true sticky header with horizontal scroll, we ideally use specific packages or TwoScrollViews.
                    // For simplicity in this task, we'll put the header inside the scroll view.

                    if (widget.rows.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Center(
                            child: CustomText("No data available",
                                color: AppPalette.textSecondary)),
                      )
                    else
                      ...widget.rows.map((row) => _buildRow(row)),
                  ],
                ),
              ),
            ),

            // Pagination Footer
            _buildPagination(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        color: AppPalette.surfaceContainer,
        border: Border(bottom: BorderSide(color: AppPalette.border)),
      ),
      child: Row(
        children: [
          ...widget.columns.map((col) => Container(
                width: col.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    CustomText(
                      col.label.toUpperCase(),
                      fontSize: 12,
                      fontWeight: FW.bold,
                      color: AppPalette.textSecondary,
                    ),
                    if (col.isSortable)
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(Icons.swap_vert,
                            size: 14, color: AppPalette.textDisabled),
                      )
                  ],
                ),
              )),
          // Actions buffer
          const SizedBox(width: 100),
        ],
      ),
    );
  }

  Widget _buildRow(TableRowData row) {
    final isHovered = _hoveredRowId == row.id;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredRowId = row.id),
      onExit: (_) => setState(() => _hoveredRowId = null),
      child: Container(
        decoration: BoxDecoration(
          color: isHovered
              ? AppPalette.surfaceContainer.withOpacity(0.5)
              : Colors.white,
          border: const Border(bottom: BorderSide(color: AppPalette.border)),
        ),
        child: InkWell(
          onTap: row.onTap,
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
                  child: row.cells.length > index
                      ? row.cells[index]
                      : const SizedBox(),
                );
              }),
              // Actions
              Container(
                // width: 100,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16),
                child: Opacity(
                  opacity: 1.0, //isHovered ? 1.0 : 0.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.onView != null)
                        _ActionButton(
                            icon: Icons.visibility_outlined,
                            onTap: () => widget.onView!(row.id)),
                      if (widget.onEdit != null)
                        _ActionButton(
                            icon: Icons.edit_outlined,
                            onTap: () => widget.onEdit!(row.id)),
                      if (widget.onDelete != null)
                        _ActionButton(
                            icon: Icons.delete_outline,
                            color: AppPalette.error,
                            onTap: () => widget.onDelete!(row.id)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPagination() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppPalette.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            "Page ${widget.currentPage} of ${widget.totalPages}",
            color: AppPalette.textSecondary,
            fontSize: 13,
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: widget.currentPage > 1
                    ? () => widget.onPageChanged?.call(widget.currentPage - 1)
                    : null,
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: widget.currentPage < widget.totalPages
                    ? () => widget.onPageChanged?.call(widget.currentPage + 1)
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const _ActionButton({required this.icon, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 18, color: color ?? AppPalette.textSecondary),
      onPressed: onTap,
      splashRadius: 20,
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
      padding: EdgeInsets.zero,
    );
  }
}
