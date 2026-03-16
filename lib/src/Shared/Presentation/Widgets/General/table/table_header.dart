import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
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
      decoration: BoxDecoration(
        color: AppColors.get.surfaceContainer,
        border: Border(bottom: BorderSide(color: AppPalette.border)),
      ),
      child: Row(
        children: [
          ...columns.map((col) => Container(
                width: col.width,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.center,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      col.label.toUpperCase(),
                      fontSize: 11,
                      fontWeight: FW.bold,
                      color: AppColors.get.textSecondary,
                    ),
                    if (col.isSortable)
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(Icons.swap_vert,
                            size: 14, color: AppColors.get.textDisabled),
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
