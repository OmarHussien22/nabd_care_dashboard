import 'package:care_desk/src/Core/Styles/Colors/app_colors.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/General/table/table_column.dart';
import 'package:care_desk/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  final List<TableColumn> columns;

  const TableHeader({super.key, required this.columns});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // Slightly taller for a more premium feel
      decoration: BoxDecoration(
        color: AppColors.get.surfaceContainer.withValues(alpha: 0.3),
        border: Border(
          bottom: BorderSide(color: AppColors.get.border.withValues(alpha: 0.8)),
        ),
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
                      fontSize: 10,
                      fontWeight: FW.bold,
                      color: AppColors.get.textSecondary,
                      letterSpacing: 1.2,
                    ),
                    if (col.isSortable)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Icon(Icons.unfold_more_rounded,
                            size: 16, color: AppColors.get.textDisabled),
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
