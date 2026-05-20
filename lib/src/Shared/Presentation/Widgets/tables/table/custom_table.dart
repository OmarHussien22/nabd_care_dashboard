import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class CustomTable extends StatefulWidget {
  final List<String> columnNames;
  final List<List<dynamic>> data;
  final List<Widget Function(dynamic data)>? customRowActions;
  final int maxLines;
  final double? minWidth;
  final bool isLoading;
  final String emptyTitle;
  final String emptyDescription;
  final VoidCallback? emptyAction;
  final String? emptyActionLabel;

  const CustomTable({
    super.key,
    required this.columnNames,
    required this.data,
    this.customRowActions,
    this.maxLines = 1,
    this.minWidth,
    this.isLoading = false,
    this.emptyTitle = 'No Records Found',
    this.emptyDescription =
        'There are no active records in this section. Add a new one to get started.',
    this.emptyAction,
    this.emptyActionLabel,
  });

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  bool selectAll = false;
  late List<bool> selectedRows;
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedRows = List.generate(widget.data.length, (_) => false);
  }

  @override
  void didUpdateWidget(covariant CustomTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data.length != selectedRows.length) {
      setState(() {
        selectedRows = List.generate(widget.data.length, (_) => false);
        selectAll = false;
      });
    }
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  void toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      for (int i = 0; i < selectedRows.length; i++) {
        selectedRows[i] = selectAll;
      }
    });
  }

  void toggleRowSelection(int index, bool? value) {
    setState(() {
      selectedRows[index] = value ?? false;
      selectAll = selectedRows.every((selected) => selected);
    });
  }

  // ─────────────────── TASK 7: COLUMN COLLAPSE LOGIC ───────────────────
  bool _shouldShowColumn(String name, double width) {
    if (width >= 900) return true; // Show all on widescreen
    final lowerName = name.toLowerCase();

    // Medium screen collapse (Tablets)
    if (width < 900 && width >= 650) {
      if (lowerName.contains('email') ||
          lowerName.contains('notes') ||
          lowerName.contains('visit type')) {
        return false;
      }
    }

    // Small screen collapse (Mobile / Small Tablet)
    if (width < 650) {
      if (lowerName.contains('email') ||
          lowerName.contains('phone') ||
          lowerName.contains('doctor') ||
          lowerName.contains('notes') ||
          lowerName.contains('visit type') ||
          lowerName.contains('time')) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;

        // Build visible columns list
        final visibleIndices = <int>[];
        for (int i = 0; i < widget.columnNames.length; i++) {
          if (_shouldShowColumn(widget.columnNames[i], screenWidth)) {
            visibleIndices.add(i);
          }
        }

        // Handle empty state (Task 8)
        if (!widget.isLoading && widget.data.isEmpty) {
          return _buildEmptyState();
        }

        // Render table dynamically taking full size of screen on wide viewports,
        // and holding a safe minimum width with scrollbars on narrow screens.
        final minWidth = widget.minWidth ?? 1100.0;
        final tableWidth =
            constraints.maxWidth > minWidth ? constraints.maxWidth : minWidth;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.toRad()),
            border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.015),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.toRad()),
            child: Scrollbar(
              controller: _horizontalScrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: tableWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 1. Table Header (Sticky: Task 5)
                      _buildTableHeader(visibleIndices, screenWidth),

                      // 2. Table Body (Scrollable: Task 5)
                      widget.isLoading
                          ? _buildLoadingState(visibleIndices, screenWidth)
                          : _buildTableBody(visibleIndices, screenWidth),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ─────────────────── STICKY HEADER WIDGET ───────────────────
  Widget _buildTableHeader(List<int> visibleIndices, double screenWidth) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.get.primary.withOpacity(0.06),
        border: Border(
            bottom: BorderSide(color: AppColors.get.border.withOpacity(0.6))),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Checkbox(
              value: selectAll,
              onChanged: toggleSelectAll,
              activeColor: AppColors.get.primary,
            ),
          ),
          ...visibleIndices.map((i) {
            final name = widget.columnNames[i];
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomText(
                  name,
                  fontSize: 13,
                  fontWeight: FW.bold,
                  color: AppColors.get.primary,
                ),
              ),
            );
          }),
          if (widget.customRowActions != null)
            const SizedBox(
              width: 140,
              child: CustomText(
                'actions',
                fontSize: 13,
                fontWeight: FW.bold,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  // ─────────────────── ROWS LIST WIDGET ───────────────────
  Widget _buildTableBody(List<int> visibleIndices, double screenWidth) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 450),
      child: Scrollbar(
        controller: _verticalScrollController,
        thumbVisibility: true,
        child: ListView.builder(
          shrinkWrap: true,
          controller: _verticalScrollController,
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            final rowData = widget.data[index];
            final isSelected = selectedRows[index];

            return InkWell(
              onTap: () => toggleRowSelection(index, !isSelected),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.get.primary.withOpacity(0.05)
                      : Colors.white,
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade100)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Checkbox(
                        value: isSelected,
                        onChanged: (v) => toggleRowSelection(index, v),
                        activeColor: AppColors.get.primary,
                      ),
                    ),
                    ...visibleIndices.map((i) {
                      final cellData = rowData[i];
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: cellData is Widget
                              ? cellData
                              : Tooltip(
                                  message: cellData.toString(),
                                  child: CustomText(
                                    cellData.toString(),
                                    fontSize: 12.5,
                                    fontWeight: FW.medium,
                                    isOverFlow: true,
                                    maxLines: widget.maxLines,
                                  ),
                                ),
                        ),
                      );
                    }),
                    if (widget.customRowActions != null)
                      SizedBox(
                        width: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              widget.customRowActions!.map((actionBuilder) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: actionBuilder(rowData),
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ─────────────────── TASK 9: SHIMMER LOADING ───────────────────
  Widget _buildLoadingState(List<int> visibleIndices, double screenWidth) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Checkbox(
                      value: false,
                      onChanged: (_) {},
                      activeColor: AppColors.get.primary),
                ),
                ...visibleIndices.map((_) => const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Bone.text(words: 2),
                      ),
                    )),
                if (widget.customRowActions != null)
                  const SizedBox(
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Bone.icon(),
                        SizedBox(width: 8),
                        Bone.icon(),
                      ],
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ─────────────────── TASK 8: EMPTY STATE ───────────────────
  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 48.toH(), horizontal: 24.toW()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.toRad()),
        border: Border.all(color: AppColors.get.border.withOpacity(0.5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.get.primary.withOpacity(0.06),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.folder_open_rounded,
                size: 56, color: AppColors.get.primary),
          ),
          20.ESH(),
          CustomText(
            widget.emptyTitle,
            fontSize: 16,
            fontWeight: FW.bold,
            color: AppColors.get.textPrimary,
          ),
          8.ESH(),
          SizedBox(
            width: 400.toW(),
            child: CustomText(
              widget.emptyDescription,
              fontSize: 12.5,
              color: AppColors.get.textSecondary,
              textAlign: TextAlign.center,
            ),
          ),
          if (widget.emptyAction != null) ...[
            24.ESH(),
            ElevatedButton.icon(
              onPressed: widget.emptyAction,
              icon: const Icon(Icons.add_rounded, size: 20),
              label: CustomText(widget.emptyActionLabel ?? 'Add New',
                  fontWeight: FW.bold, color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.get.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: 24.toW(), vertical: 14.toH()),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────── TASK 3 & 4: STANDARDIZED ACTION BUTTONS ───────────────────
class ActionIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String? tooltipMessage;

  const ActionIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
    this.tooltipMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage ?? "Action",
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(0.95),
        borderRadius: BorderRadius.circular(6.toRad()),
      ),
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.toRad()),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8.toRad()),
              border: Border.all(color: color.withOpacity(0.18)),
            ),
            child: Icon(
              icon,
              size: 16.toRad(),
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
