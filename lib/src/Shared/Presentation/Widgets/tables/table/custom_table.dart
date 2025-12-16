import 'package:flutter/material.dart';
import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class CustomTable extends StatefulWidget {
  final List<String> columnNames;
  final List<List<dynamic>> data;
  final List<Widget Function(dynamic data)>? customRowActions;
  final int maxLines;
  final double? minWidth;

  const CustomTable({
    super.key,
    required this.columnNames,
    required this.data,
    this.customRowActions,
    this.maxLines = 2,
    this.minWidth,
  });

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  bool selectAll = false;
  late List<bool> selectedRows;

  @override
  void initState() {
    super.initState();
    selectedRows = List.generate(widget.data.length, (_) => false);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(4.toW()),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.toW()),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.toW()),
          child: Scrollbar(
            thumbVisibility: true,
            radius: Radius.circular(10.toRad()),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                showCheckboxColumn: false,
                dataRowMinHeight: 45.toH(),
                dataRowMaxHeight: 70.toH(),
                headingRowHeight: 50.toH(),
                dividerThickness: 0.6,
                headingTextStyle: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.get.primary,
                ),
                headingRowColor: WidgetStateProperty.all(
                  AppColors.get.primary.withOpacity(0.07),
                ),
                columns: [
                  DataColumn(
                    label: Checkbox(
                      value: selectAll,
                      onChanged: toggleSelectAll,
                      activeColor: AppColors.get.primary,
                    ),
                  ),
                  for (var columnName in widget.columnNames)
                    DataColumn(
                      label: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.toW()),
                        child: CustomText(
                          columnName,
                          fontWeight: FW.semiBold,
                          fontSize: 4.2,
                          fontWeight: FW.semiBold,
                          fontSize: 4.2,
                          maxLines: widget.maxLines,
                          isOverFlow: true,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  if (widget.customRowActions != null)
                    const DataColumn(label: Text("Actions")),
                ],
                rows: List.generate(widget.data.length, (index) {
                  final rowData = widget.data[index];
                  final isSelected = selectedRows[index];
              
                  return DataRow(
                    color: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (isSelected) {
                          return AppColors.get.primary.withOpacity(0.08);
                        }
                        if (states.contains(WidgetState.hovered)) {
                          return AppColors.get.primary.withOpacity(0.05);
                        }
                        return Colors.white;
                      },
                    ),
                    cells: [
                      DataCell(
                        Checkbox(
                          value: isSelected,
                          onChanged: (v) => toggleRowSelection(index, v),
                          activeColor: AppColors.get.primary,
                        ),
                      ),
                      for (var cellData in rowData)
                        DataCell(
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.toW(), vertical: 4.toH()),
                            child: ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: widget.minWidth ?? 140.toW()),
                              child: CustomText(
                                cellData.toString(),
                                fontSize: 4,
                                textAlign: TextAlign.start,
                                maxLines: widget.maxLines,
                                isOverFlow: true,
                              ),
                            ),
                          ),
                        ),
                      if (widget.customRowActions != null)
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var action in widget.customRowActions!)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.toW()),
                                  child: action(rowData),
                                ),
                            ],
                          ),
                        ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
    return InkWell(
      borderRadius: BorderRadius.circular(6.toW()),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 32.toH(),
        padding: EdgeInsets.symmetric(vertical: 2.toH(), horizontal: 3.toW()),
        // margin: EdgeInsets.all(2.toW()),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.toRad()),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Center(
            child: Tooltip(
          message: tooltipMessage ?? "Omar",
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.get.greyLight.withOpacity(0.8),
            borderRadius: BorderRadius.circular(5.toRad()),
          ),
          child: Icon(
            icon,
            size: 18,
            color: color,
          ),
        )),
      ),
    );
  }
}
