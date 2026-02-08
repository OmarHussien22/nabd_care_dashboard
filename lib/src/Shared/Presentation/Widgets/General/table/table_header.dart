import 'package:care_desk/src/Core/Styles/Colors/app_palette.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_column.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  final List<TableColumn> columns;

  const TableHeader({super.key, required this.columns});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        color: AppPalette.surfaceContainer,
        border: Border(bottom: BorderSide(color: AppPalette.border)),
      ),
      child: Row(
        children: [
          ...columns.map((col) => Container(
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
}
